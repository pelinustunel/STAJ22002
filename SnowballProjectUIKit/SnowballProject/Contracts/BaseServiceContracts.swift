//
//  BaseServiceContracts.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 20.08.2024.
//

import Foundation
import Alamofire

protocol BaseServiceContracts {
    
    // Generic
    associatedtype ResponseType : Decodable
    
    func request(endpoint: String, method: HTTPMethod, parameters: Parameters?, completion: @escaping(Result<ResponseType, Error>) -> Void)
    
    
}
