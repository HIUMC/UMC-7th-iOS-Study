//
//  SearchModel.swift
//  APIPractice
//
//  Created by 이현주 on 11/17/24.
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
