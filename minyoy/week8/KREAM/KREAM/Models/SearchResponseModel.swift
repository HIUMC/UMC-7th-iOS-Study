//
//  SearchResponseModel.swift
//  KREAM
//
//  Created by 주민영 on 11/20/24.
//

import Foundation

struct SearchResponseModel: Codable {
    let products: [SearchTitle]?
}

struct SearchTitle: Codable {
    let title: String?
}
