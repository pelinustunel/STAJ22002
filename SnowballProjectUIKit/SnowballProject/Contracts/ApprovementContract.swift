//
//  ApprovementsContract.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 21.08.2024.
//

import Foundation
import Alamofire

struct Approved : Decodable {
    var name: String
    var status: [Bool]
}

struct StatusStruct : Decodable {
    var id: Int
    var client: String
    var opener: String
    var approvedList: [Approved]
    
    func checkStatus() -> String {
        for approved in approvedList {
            if approved.status.contains(false) {
                return "Waiting for: "
            }
        }
        return "Approved"
    }
}


protocol ApprovementContract : ContractBase {
    func onAuthorize(response : StatusStruct)
}
