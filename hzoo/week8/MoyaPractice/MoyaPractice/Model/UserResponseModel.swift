//
//  UserResponseModel.swift
//  MoyaPractice
//
//  Created by 이현주 on 11/24/24.
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