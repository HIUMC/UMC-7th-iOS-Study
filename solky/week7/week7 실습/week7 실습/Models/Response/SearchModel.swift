//
//  SearchModel.swift
//  week7 실습
//
//  Created by 이태림 on 11/14/24.
//

struct SearchModel: Codable {
    let documents: [DetailDocument]
}

struct DetailDocument: Codable {
    let contents: String
    let datetime: String
    let title: String
    let url: String
}
