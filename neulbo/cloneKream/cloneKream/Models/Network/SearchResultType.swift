//
//  SearchResultType.swift
//  cloneKream
//
//  Created by 김서현 on 11/25/24.
//

import Foundation
import Moya

enum SearchResultType {
    case getSearchResults(keyword: String)
}

extension SearchResultType: TargetType {
    var baseURL: URL {
        guard let baseURL = URL(string: "https://dummyjson.com") else { fatalError("Error: Invalid URL") }
        return baseURL
    }
    
    
    var path: String {
        switch self {
        case .getSearchResults:
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getSearchResults:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getSearchResults(let keyword):
            return .requestParameters(parameters: ["q" : keyword], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type" : "application/json"]
    }
    
    
}
