//
//  UserResponseModel.swift
//  ExampleMoya
//
//  Created by 주민영 on 11/19/24.
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
