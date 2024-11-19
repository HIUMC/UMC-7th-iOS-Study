//
//  SearchModel.swift
//  7st
//
//  Created by 주민영 on 11/15/24.
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
