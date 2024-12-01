//
//  searchResponseModel.swift
//  Kream
//
//  Created by KoNangYeon on 11/22/24.
//

import Foundation

struct searchResponseModel : Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let title : String
}

