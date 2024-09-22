//
//  AutherizeService.swift
//  AlamofireEntegresyonu
//
//  Created by Pelin Üstünel on 19.08.2024.
//

import Foundation
import Alamofire

struct Login: Encodable {
    
    let email: String
    let password: String
    
}

class AutherizeService {
    
    let login = Login(email: "test@test.test", password: "testPassword")
    
    func autherize(username: String, password : String, listener: AutherizaContract) {
        
        AF.request("https://httpbin.org/post",
                   method: .post,
                   parameters: login,
                   encoder: JSONParameterEncoder.default).responseDecodable(of: AutherizeResponse.self) { response in
            
            switch(response.result) {
                
            case .success( let data  ):
                listener.onAutherize(response: data)
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
