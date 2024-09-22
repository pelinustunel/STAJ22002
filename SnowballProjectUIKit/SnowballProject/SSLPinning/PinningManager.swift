//
//  PinningManager.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 29.08.2024.
//

import CommonCrypto
import CryptoKit
import Foundation

struct PinningManager {

    /// Common errors of SSL Pinning
    private enum PinningError: Error {
        
        case noCertificatesFromServer
        case failedToGetPublicKey
        case failedToGetDataFromPublicKey
        case receivedWrongCertificate
        case failedToGetPublicKeySize
        
        var localizedDescription: String {
            switch self {
            case .noCertificatesFromServer: return "Can not retrieve certificate"
            case .failedToGetPublicKey: return "Public Key (PK) could not fetch"
            case .failedToGetDataFromPublicKey: return "Can not extract data from Public Key"
            case .receivedWrongCertificate: return "Wrong Certificate"
            case .failedToGetPublicKeySize: return "Can not retrieve key size"
            }
        }
    }
    
    /// Abstract Syntax Notation One, ASN.1
    private enum ASN1Header {
        
        case rsa2048
        case rsa4096
        
        var bytes: [UInt8] {
            switch self {
            case .rsa2048:
                return [0x30, 0x82, 0x01, 0x22, 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x01, 0x05, 0x00, 0x03, 0x82, 0x01, 0x0f, 0x00]
                
            case .rsa4096:
                return [0x30, 0x82, 0x02, 0x22, 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x01, 0x05, 0x00, 0x03, 0x82, 0x02, 0x0f, 0x00]
            }
        }
    }
    
    /// Pinlenecek Public Key Hashleri
    private var pinnedKeyHashes: [String]!

    init(pinnedKeyHashes: [String]) {
        self.pinnedKeyHashes = pinnedKeyHashes
    }

    /// Yeni public key set etmek için
    /// - Parameter pk: String...
    mutating func setNewPK(_ pk: String...) {
        pinnedKeyHashes = pk
    }
    
    /// Verilen datanın SHA256 Digest (özet)'ini döner, verilen Pinler ile aynısı bu metotta elde edilmeye çalışılır
    /// - Parameter data: ASN1Header ve PublicKey'in datası eklenerek
    /// - Returns: PublicKey Hash
    private func sha256(_ data: Data) -> Data {
        
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        
        _ = data.withUnsafeBytes { buffer in
            CC_SHA256(buffer.baseAddress, CC_LONG(data.count), &digest)
        }
        
        return Data(bytes: digest, count: digest.count)
    }
    
    /// PublicKey Hashe Göre ASN.1 Header verilir
    /// - Parameter key: Public Key (PK)
    /// - Returns: ASN.1 Header
    private func getSecKeyBlockSize(_ key: SecKey) throws -> ASN1Header {
        
        let size = SecKeyGetBlockSize(key)
        
        if size == 256 {
            return .rsa2048
        }
        
        if size == 512 {
            return .rsa4096
        }
        
        throw PinningError.failedToGetPublicKeySize
    }
    
    /// İlk metot, pinningin başarılı olup olmadığına karar verecek yer
    /// - Parameters:
    ///   - challenge: URLAuthenticationChallenge
    ///   - completionHandler: (URLSession.AuthChallengeDisposition, URLCredential?)
    func validate(challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        do {
            let trust = try validateAndGetTrust(with: challenge)
            
            completionHandler(.performDefaultHandling, URLCredential(trust: trust))
        } catch {
            completionHandler(.cancelAuthenticationChallenge, nil)
        }
    }
    
    /// URL'den Trust seritifkaları alınır
    /// - Parameter challenge: URLAuthenticationChallenge
    /// - Returns: SecTrust
    private func validateAndGetTrust(with challenge: URLAuthenticationChallenge) throws -> SecTrust {
        
        guard let trust = challenge.protectionSpace.serverTrust else {
            throw PinningError.noCertificatesFromServer
        }
        
        var trustCertificateChain: [SecCertificate] = []

        if #available(iOS 12.0, *) {

                for index in 0..<3 {
                //0 > RSA 2048 bits (e 65537) / SHA256withRSA
                //1 > 2048 bits (e 65537) / SHA384withRSA
                //2 > RSA 4096 bits (e 65537) / SHA384withRSA
                if let cert = SecTrustGetCertificateAtIndex(trust, index) { // RSA 2048 bits (e 65537) / SHA256withRSA
                    trustCertificateChain.append(cert)
                }
            }
        }
        
        if #available(iOS 15.0, *) {
            trustCertificateChain = SecTrustCopyCertificateChain(trust) as! [SecCertificate]
        }
        
        for serverCertificate in trustCertificateChain {
            let publicKey = try getPublicKey(for: serverCertificate)
            let header = try getSecKeyBlockSize(publicKey)
            let publicKeyHash = try getKeyHash(of: publicKey, header: header)
            
            if pinnedKeyHashes.contains(publicKeyHash) {
                return trust
            }
        }
        
        
        throw PinningError.receivedWrongCertificate
    }
    
    /// Alınan sertifikanın içinden Public Key (PK) oluşturulur ve dönülür
    /// - Parameter certificate: SecCertificate
    /// - Returns: SecKey
    private func getPublicKey(for certificate: SecCertificate) throws -> SecKey {
        
        let policy = SecPolicyCreateBasicX509()
        var trust: SecTrust?
        
        let trustCreationStatus = SecTrustCreateWithCertificates(certificate, policy, &trust)

        if let trust, trustCreationStatus == errSecSuccess {
            var publicKey: SecKey?
            
            if #available(iOS 15, *) {
                publicKey = SecTrustCopyKey(trust)
            }
            
            if #available(iOS 12, *) {
                publicKey = SecCertificateCopyKey(certificate)
            }
            
            if publicKey == nil {
                throw PinningError.failedToGetPublicKey
            }
            
            return publicKey!
        } else {
            
            throw PinningError.failedToGetPublicKey
        }
    }
    
    /// Public Key (PK) Hashi OIuşturulur
    /// - Parameters:
    ///   - publicKey: SecKey
    ///   - header: ASN1Header
    /// - Returns: String
    private func getKeyHash(of publicKey: SecKey, header: ASN1Header) throws -> String {
        
        guard let publicKeyCFData = SecKeyCopyExternalRepresentation(publicKey, nil) else {
            throw PinningError.failedToGetDataFromPublicKey
        }
        
        let publicKeyData = (publicKeyCFData as NSData) as Data
        
        var publicKeyWithHeaderData: Data
        publicKeyWithHeaderData = Data(header.bytes)
    
        publicKeyWithHeaderData.append(publicKeyData)
        let publicKeyHashData = sha256(publicKeyWithHeaderData)
        
        return publicKeyHashData.base64EncodedString()
    }
}


