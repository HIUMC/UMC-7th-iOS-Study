//
//  SearchTargetType.swift
//  KREAM
//
//  Created by 이태림 on 11/25/24.
//

import Foundation
import Moya

enum SearchTargetType {
    case getAllProducts(keyword: String)
}

extension SearchTargetType : TargetType {
    var baseURL: URL {
        guard let baseURL = URL(string: "https://dummyjson.com") else {
            fatalError("Error: Invalid URL")
        }
            
        return baseURL
    }
    
    var path: String {
        switch self {
        case .getAllProducts:
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllProducts:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAllProducts(let keyword):
            return .requestParameters(parameters: ["q": keyword], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
