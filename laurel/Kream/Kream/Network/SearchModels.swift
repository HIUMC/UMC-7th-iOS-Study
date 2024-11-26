//
//  SearchModels.swift
//  Kream
//
//  Created by 어진 on 11/25/24.
//

import Foundation

struct SearchResponse: Decodable {
    let products: [SearchProduct]
}

struct SearchProduct: Decodable {
    let id: Int
    let title: String
}
