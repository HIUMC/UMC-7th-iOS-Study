//
//  UserResponseModel.swift
//  project8
//
//  Created by KoNangYeon on 11/20/24.
//

import Foundation

struct UserResponseModel : Codable {
    let id: Int
    let email: String
    let password: String
    let name: String
    let role: String
    let avatar: String
}
