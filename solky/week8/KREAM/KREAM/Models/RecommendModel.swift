//
//  Untitled.swift
//  KREAM
//
//  Created by 이태림 on 11/25/24.
//

import UIKit

struct RecommendModel {
    let name: String
}

extension RecommendModel {
    static func recommenddummy() -> [RecommendModel] {
        return [
            RecommendModel(name: "채원 슈프림 후리스"),
            RecommendModel(name: "나이키V2K런"),
            RecommendModel(name: "뉴발란스996"),
            RecommendModel(name: "신상 나이키 콜라보"),
            RecommendModel(name: "허그 FW 패딩"),
            RecommendModel(name: "벨루어 눕시")
        ]
    }
}

