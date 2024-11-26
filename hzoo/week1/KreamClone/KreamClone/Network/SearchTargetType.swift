//
//  SearchTargetType.swift
//  KreamClone
//
//  Created by 이현주 on 11/25/24.
//
import Foundation
import Moya

enum SearchTargetType {
    case getResultName(q: String)
}

extension SearchTargetType: TargetType {
    var baseURL: URL {
        guard let baseURL = URL(string: "https://dummyjson.com") else {
            fatalError("Error: Invalid URL")
        }
        return baseURL
    }
    
    var path: String {
        switch self {
        case .getResultName:
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getResultName(let q):
            return .requestParameters(parameters: ["q": q], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type" : "application/json"]
    }
}
