//
//  ProductAPI.swift
//  Kream
//
//  Created by 어진 on 11/25/24.
//

import Foundation
import Moya

enum ProductAPI {
    case searchProducts(query: String)
}

extension ProductAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://dummyjson.com")!
    }

    var path: String {
        switch self {
        case .searchProducts:
            return "/products/search"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        switch self {
        case .searchProducts(let query):
            return .requestParameters(parameters: ["q": query], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    var sampleData: Data {
        """
        {
            "products": [
                { "id": 1, "name": "팀버랜드" },
                { "id": 2, "name": "슈프림 팀버랜드" },
                { "id": 3, "name": "팀버랜드 6인치" }
            ]
        }
        """.data(using: .utf8)!
    }
}
