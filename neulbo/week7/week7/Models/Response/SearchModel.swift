//
//  SearchModel.swift
//  week7
//
//  Created by 김서현 on 11/17/24.
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
