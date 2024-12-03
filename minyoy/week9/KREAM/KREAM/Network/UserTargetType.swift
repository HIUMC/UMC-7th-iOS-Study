//
//  UserTargetType.swift
//  KREAM
//
//  Created by 주민영 on 11/20/24.
//

import Foundation
import Moya

enum UserTargetType {
    case getProductTitle(query: String)
}

extension UserTargetType: TargetType {
    var baseURL: URL {
        guard let baseURL = URL(string: "https://dummyjson.com") else {
            fatalError("Error: Invalid URL")
        }
        
        return baseURL
    }
    
    var path: String {
        switch self {
        case .getProductTitle:
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getProductTitle:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getProductTitle(let query):
            return .requestParameters(parameters: ["q": query], encoding: URLEncoding.queryString)
        }
}
    
    var headers: [String : String]? {
        return ["Content-Type" : "application/json"]
    }
}
