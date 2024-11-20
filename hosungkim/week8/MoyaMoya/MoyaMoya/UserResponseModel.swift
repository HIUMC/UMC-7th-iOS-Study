//
//  UserResponseModel.swift
//  MoyaMoya
//
//  Created by 김호성 on 2024.11.20.
//

import Foundation

struct UserResponseModel: Codable {
    let id: Int
    let email: String
    let password: String
    let name: String
    let role: String
    let avatar: String
}
