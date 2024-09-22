//
//  RefreshTokenContract.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 25.08.2024.
//

import Foundation

protocol RefreshTokenContract: ContractBase {
    func onTokenRefreshed(tokenResult: RefreshTokenResponse)
}
