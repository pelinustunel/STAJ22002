//
//  RefreshTokenService.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 25.08.2024.
//

import Foundation

private struct RefreshTokenRequest: Encodable {
    let grant_type: String
    let scope: String
    let code: String?
    let assertion: String?
    let client_id: String
    let client_secret: String
    let code_verifier: String?
    let attestation_token: String?
}

struct RefreshTokenResponse: Decodable {
    let access_token: String
    let token_type: String
    let expires_in: Int
    let refresh_token: String
}

class RefreshTokenService: BaseService<RefreshTokenResponse> {
   
    
    func refresh(completion: @escaping (Result<RefreshTokenResponse, Error>) -> Void) {
        let request = RefreshTokenRequest(
            grant_type: "refresh_token",
            scope: "https://cbpp",
            code: TokenStore.shared.token.refreshToken,
            assertion: nil,
            client_id: "wlapp",
            client_secret: "10o5fjXu",
            code_verifier: nil,
            attestation_token: nil)
        
        self.request(
            endpoint: "/Mpoc/OpenAuth/sts/api/token",
            method: .post,
            parameters: request) { response in
                switch response {
                    
                case .success(let data):
                    completion(.success(data))
                 
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
