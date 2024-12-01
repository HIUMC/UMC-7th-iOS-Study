//
//  SearchResponseModel.swift
//  KREAM
//
//  Created by 이태림 on 11/25/24.
//

import Foundation

struct SearchResponseModel: Codable {
    let products: [SearchResponse]?
}

struct SearchResponse: Codable {
    let title: String?
}
