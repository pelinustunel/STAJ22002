//
//  ScriptContract.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 21.08.2024.
//

import Foundation
import Alamofire

struct ScriptApproved : Decodable {
    var name: String
    var status: [Bool]
}

struct ScriptStatusStruct : Decodable {
    var id: Int
    var client: String
    var opener: String
    var approvedList: [ScriptApproved]
    
    func checkStatus() -> String {
        for approved in approvedList {
            if approved.status.contains(false) {
                return "Waiting for: "
            }
        }
        return "Approved"
    }
}


protocol ScriptContract : ContractBase {
    func onAuthorize(response : ScriptStatusStruct)
}
