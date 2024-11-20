//
//  UserTargetType.swift
//  MoyaMoya
//
//  Created by 김호성 on 2024.11.20.
//

import Foundation
import Moya

enum UserTargetType {
    case getAllUsers
    case postFile(image: Data)
}

extension UserTargetType: TargetType {
    var baseURL: URL {
        guard let baseURL = URL(string: "https://api.escuelajs.co") else { fatalError("Error: Invalid Base URL") }
        return baseURL
    }
    
    var path: String {
        switch self {
        case .getAllUsers:
            return "/api/v1/users"
        case .postFile:
            return "/api/v1/files/upload"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllUsers:
            return .get
        case .postFile:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getAllUsers:
            return .requestPlain
        case let .postFile(image):
            let formData = MultipartFormData(provider: .data(image), name: "file", fileName: "jokeBear", mimeType: "image/png")
            return .uploadMultipart([formData])
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getAllUsers:
            return [
                "Content-Type": "application/json",
            ]
        case .postFile(let image):
            return [
                "Content-Type" : "multipart/form-data",
            ]
        }
    }
    
    
}
