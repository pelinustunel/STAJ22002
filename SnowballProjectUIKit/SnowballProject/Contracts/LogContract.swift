//
//  LogContract.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 21.08.2024.
//

import Foundation
import Alamofire

struct LogApproved : Decodable {
    var name: String
    var status: [Bool]
}

struct LogStatusStruct : Decodable {
    var id: Int
    var client: String
    var opener: String
    var approvedList: [LogApproved]
    
    func checkStatus() -> String {
        for approved in approvedList {
            if approved.status.contains(false) {
                return "Waiting for: "
            }
        }
        return "Approved"
    }
}


protocol LogContract : ContractBase {
    func onAuthorize(response : LogStatusStruct)
}
