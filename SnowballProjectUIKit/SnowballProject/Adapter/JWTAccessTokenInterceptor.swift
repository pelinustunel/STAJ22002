//
//  JWTAccessTokenAdapter.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 21.08.2024.
//

import Foundation
import Alamofire

final class JWTAccessTokenInterceptor: RequestInterceptor {
    
    typealias JWT = String
    
    func adapt(_ urlRequest: URLRequest, for session: Alamofire.Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        
        if let accessToken = TokenStore.shared.token.accesToken {
            urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        }
        
        completion(.success(urlRequest))
    }
    
    
    func retry(_ request: Request, for session: Alamofire.Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            completion(.doNotRetry)
            return
        }
        
        RefreshTokenService().refresh() { response in
            switch response {
            case .success(let data):
                TokenStore.shared.token = Token(accesToken: data.access_token, refreshToken: data.refresh_token)
                completion(.retry)
            case .failure(_):
                completion(.doNotRetry)
                
            }
        }
    }
}
