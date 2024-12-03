//
//  CommonRestAPI.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.20.
//

import Foundation
import Moya

enum CommonRestAPI {
    case getProduct(search: String)
}

extension CommonRestAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://dummyjson.com")!
    }
    
    var path: String {
        switch self {
        case .getProduct(let search):
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getProduct(let search):
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getProduct(let search):
            let params: [String: Any] = [
                "q": search,
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getProduct(let search):
            return [
                "Content-Type": "application/json",
            ]
        }
    }
}
