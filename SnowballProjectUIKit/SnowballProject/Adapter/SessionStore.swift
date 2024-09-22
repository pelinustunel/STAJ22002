//
//  SessionStore.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 25.08.2024.
//

import Foundation
import Alamofire

class SessionStore {
    
    var session: Session
    
    private init() {
        session = Session(interceptor: JWTAccessTokenInterceptor())
    }
    
    static let shared = SessionStore()
}
