//
//  ProductsResponse.swift
//  Kream
//
//  Created by 어진 on 11/25/24.
//

import Foundation

struct ProductsResponse: Decodable {
    let products: [Product]
}

struct Product: Decodable {
    let id: Int
    let name: String
}
