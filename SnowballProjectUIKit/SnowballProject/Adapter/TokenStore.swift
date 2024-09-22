//
//  Adapter.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 22.08.2024.
//

import Foundation

struct Token {
    let accesToken: String?
    let refreshToken: String?
}

class TokenStore {
    static let shared = TokenStore()
    var token: Token = Token(accesToken: nil, refreshToken: nil)
    
    private init() {}
    
}
