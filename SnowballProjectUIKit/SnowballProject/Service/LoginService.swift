//
//  LoginService.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 20.08.2024.
//

import Foundation
import Alamofire

private struct LoginRequest: Encodable {
    let grant_type: String
    let scope: String
    let user_id: String
    let password: String
    let code: String
    let redirect_uri: String
    let refresh_token: String?
    let assertion: String?
    let client_id: String
    let client_secret: String
    let code_verifier: String?
    let attestation_token: String?
}

struct LoginResponse: Decodable {
    let access_token: String
    let token_type: String
    let expires_in: Int
    let refresh_token: String
}

class LoginService: BaseService<LoginResponse>  {
    private var listener : LoginContracts
    
    init(listener: LoginContracts) {
        self.listener = listener
    }
    
    func authorize(userName: String, password: String) {
        
        let login = LoginRequest(
            grant_type: "password",
            scope: "https://cbpp",
            user_id: "wl-instance-1168",
            password: "Lym246vG6977VUVupspdyA==",
            code: "",
            redirect_uri: "https://wlapp",
            refresh_token: nil,
            assertion: nil,
            client_id: "wlapp",
            client_secret: "10o5fjXu",
            code_verifier: nil,
            attestation_token: nil)
        
        self.request(
            endpoint: "/Mpoc/OpenAuth/sts/api/token",
            method: .post, 
            parameters: login) { response in
                switch response {
                    
                case .success(let data):
                    self.listener.onAuthorize(loginResult: data)
                 
                case .failure(let error):
                    self.listener.onError(error: error)
                }
            }
    }
}

