//
//  UserReponseModel.swift
//  week8 실습
//
//  Created by 이태림 on 11/25/24.
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
