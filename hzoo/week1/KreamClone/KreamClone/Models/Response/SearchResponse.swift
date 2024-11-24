//
//  searchResponse.swift
//  KreamClone
//
//  Created by 이현주 on 11/25/24.
//

import Foundation

struct SearchResponse: Codable {
    let products: [Product]
}

struct Product: Codable {
    let title: String
}
