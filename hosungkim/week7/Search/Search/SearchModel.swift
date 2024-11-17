//
//  SearchModel.swift
//  Search
//
//  Created by 김호성 on 2024.11.14.
//

import Foundation

struct SearchModel: Codable {
    let documents: [DetailDocument]
}

struct DetailDocument: Codable {
    let contents: String
    let datetime: String
    let title: String
    let url: String
}
