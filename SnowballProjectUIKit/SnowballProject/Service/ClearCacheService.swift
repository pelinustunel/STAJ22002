//
//  ClearCacheService.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 26.08.2024.
//

import Foundation

private struct ClearCacheRequest: Encodable {
    let grant_type: String?
    let scope: String?
    let user_id: String?
    let password: String?
    let code: String?
    let redirect_uri: String?
    let refresh_token: String?
    let assertion: String?
    let client_id: String?
    let client_secret: String?
    let code_verifier: String?
    let attestation_token: String?
}

struct ClearCacheResponse: Decodable {
    let access_token: String
    let token_type: String
    let expires_in: Int
    let refresh_token: String
}


class ClearCacheService: BaseService<ClearCacheResponse>  {
    private var listener : ClearCacheContract
    
    init(listener: ClearCacheContract) {
 
        self.listener = listener
    }
    
    func authorize(userName: String, password: String) {
        
        let clear = ClearCacheRequest(
            grant_type: nil,
            scope: nil,
            user_id: nil,
            password: nil,
            code: nil,
            redirect_uri: nil,
            refresh_token: nil,
            assertion: nil,
            client_id: nil,
            client_secret: nil,
            code_verifier: nil,
            attestation_token: nil)
        
        self.request(
            endpoint: "Mpoc/MAM/softpos/api/clearcache",
            method: .post,
            parameters: clear) { response in
                switch response {
                    
                case .success(let data):
                    self.listener.onAuthorize(clearCahceResult: data)
                 
                case .failure(let error):
                    self.listener.onError(error: error)
                }
            }
    }
}

