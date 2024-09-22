//
//  ClearCacheBase.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 26.08.2024.
//

import Foundation

protocol ClearCacheContract : ContractBase {
    func onAuthorize(clearCahceResult: ClearCacheResponse)
}

