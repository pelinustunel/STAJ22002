//
//  SSLPinningManager.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 29.08.2024.
//

import Foundation
import Alamofire
import CryptoKit

class SSLPinningManager: NSObject {
    
    static let publicKeyHash = "vjkTbefpco8JxIGxz19DHtv1g4Bt2viydlVAhRaRhK0="
    
    private static let rsa2048Asn1Header: [UInt8] = [
        0x30, 0x82, 0x01, 0x22, 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86,
        0xf7, 0x0d, 0x01, 0x01, 0x01, 0x05, 0x00, 0x03, 0x82, 0x01, 0x0f, 0x00
    ]
    
    func requestToStartSSLPinning(withURL url: URL, completion: @escaping (String) -> Void) {
        let sessionManager: Session = {
            let evaluators: [String: ServerTrustEvaluating] = [
                "yourdomain.com": PublicKeysTrustEvaluator(keys: Bundle.main.af.publicKeys,
                                                           performDefaultValidation: true,
                                                           validateHost: true)
            ]
            let serverTrustManager = ServerTrustManager(evaluators: evaluators)
            let configuration = URLSessionConfiguration.af.default
            return Session(configuration: configuration, serverTrustManager: serverTrustManager)
        }()
        
        sessionManager.request(url).validate().responseString { dataResponse in
            var responseMessage = ""
            switch dataResponse.result {
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                responseMessage = "SSL Pinning Failed"
            case .success(let value):
                print("Received data:\n\(value)")
                responseMessage = "SSL Pinning with Public key is successfully completed"
            }
            DispatchQueue.main.async {
                completion(responseMessage)
            }
        }
    }
    
    private func sha256(data: Data) -> String {
        var keyWithHeader = Data(SSLPinningManager.rsa2048Asn1Header)
        keyWithHeader.append(data)
        
        let hash = SHA256.hash(data: keyWithHeader)
        
        return Data(hash).base64EncodedString()
    }
    
}


