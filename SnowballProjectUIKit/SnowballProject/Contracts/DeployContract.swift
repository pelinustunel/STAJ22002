//
//  DeployContract.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 21.08.2024.
//

import Foundation
import Alamofire

struct DeployApproved : Decodable {
    var name: String
    var status: [Bool]
}

struct DeployStatusStruct : Decodable {
    var id: Int
    var client: String
    var opener: String
    var approvedList: [DeployApproved]
    
    func checkStatus() -> String {
        for approved in approvedList {
            if approved.status.contains(false) {
                return "Waiting for: "
            }
        }
        return "Approved"
    }
}


protocol DeployContract : ContractBase {
    func onAuthorize(response : DeployStatusStruct)
}
