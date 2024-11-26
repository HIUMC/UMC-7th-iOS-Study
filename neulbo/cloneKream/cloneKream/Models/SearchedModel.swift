//
//  SearchedModel.swift
//  cloneKream
//
//  Created by 김서현 on 11/25/24.
//

import Foundation

struct SearchedModel {
    let keyword: String
}

extension SearchedModel {
    static func dummy() -> [SearchedModel] {
        return [
            SearchedModel(keyword: "채원 슈프림 후리스"),
            SearchedModel(keyword: "나이키V2K런"),
            SearchedModel(keyword: "뉴발란드996"),
            SearchedModel(keyword: "신상 나이키 콜라보"),
            SearchedModel(keyword: "허그 FW 패딩"),
            SearchedModel(keyword: "벨루어 눕시")
        ]
    }
}


