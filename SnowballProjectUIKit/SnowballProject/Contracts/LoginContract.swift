//
//  LoginContracts.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 20.08.2024.
//

import Foundation
import Alamofire

protocol LoginContracts : ContractBase {
    func onAuthorize(loginResult: LoginResponse)
}

