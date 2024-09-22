//
//  BaseServiceClass.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 20.08.2024.
//

import Foundation
import Alamofire

enum NetworkError : Error {
    case noInternetConnection
    case noData
    case clientError(statuCode: Int, error: Error)
    case serverError(statusCode: Int, error: Error)
}

//struct Certificates {
//    static let myCertificate: SecCertificate = {
//        let filePath = Bundle.main.path(forResource: "your_certificate", ofType: "cer")!
//        let data = try! Data(contentsOf: URL(fileURLWithPath: filePath))
//        let certificate = SecCertificateCreateWithData(nil, data as CFData)!
//        return certificate
//    }()
//}



class BaseService<T : Decodable> {
    
    typealias ResponseType = T
    
    private let BASE_URL = "https://devmpoc.provisionpay.com"
    
//    private let session: Session
    
    public init(){
        
//        // Sertifika doğrulama kurallarını tanımlayın
//         let serverTrustPolicies: [String: ServerTrustEvaluating] = [
//             "www.example.com": PinnedCertificatesTrustEvaluator(
//                 certificates: [Certificates.myCertificate],
//                 acceptSelfSignedCertificates: false,
//                 performDefaultValidation: true,
//                 validateHost: true
//             )
//         ]
//         
//         // ServerTrustManager ve Alamofire Session oluşturma
//         let serverTrustManager = ServerTrustManager(evaluators: serverTrustPolicies)
//         session = Session(serverTrustManager: serverTrustManager)
//        
    }
    
    
    func checkInternetConnection() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    func request(endpoint: String,
                 method: Alamofire.HTTPMethod,
                 parameters: Encodable,
                 completion: @escaping (Result<T, Error>) -> Void) {
        guard checkInternetConnection() else {
            completion(.failure(NetworkError.noInternetConnection))
            return
        }
        
        /*let adapter = JWTAccessTokenAdapter(activeToken: Adapter.shared.activeToken, refreshToken: Adapter.shared.refreshToken?.refreshToken!)*/
 
        SessionStore.shared.session.request(BASE_URL + endpoint,
                        method: method,
                        parameters: parameters,
                        encoder: JSONParameterEncoder.default)
        .responseDecodable(of: ResponseType.self)
        { response in
            
            switch response.result {
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                if let statusCode = response.response?.statusCode {
                    switch statusCode {
                    case 200...299:
                        if let data = response.value {
                            completion(.success(data))
                        } else {
                            completion(.failure(NetworkError.noData))
                        }
                    case 400...499:
                        completion(.failure(NetworkError.clientError(statuCode: statusCode, error: error)))
                    default:
                        completion(.failure(NetworkError.serverError(statusCode: statusCode, error: error)))
                    }
                }
            }
            
        }
        
    }
}
