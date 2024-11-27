//
//  SearchRecModel.swift
//  KREAM
//
//  Created by 주민영 on 11/20/24.
//

import Foundation

struct SearchRecModel {
    let text: String
}

extension SearchRecModel {
    static func dummy() -> [SearchRecModel] {
        return [
            SearchRecModel(text: "채원 슈프림 후리스"),
            SearchRecModel(text: "나이키V2K런"),
            SearchRecModel(text: "뉴발란드996"),
            SearchRecModel(text: "신상 나이키 콜라보"),
            SearchRecModel(text: "허그 FW 패딩"),
            SearchRecModel(text: "벨루어 눕시"),
        ]
    }
}
