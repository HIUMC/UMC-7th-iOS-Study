//
//  RecomWordModel.swift
//  KreamClone
//
//  Created by 이현주 on 11/24/24.
//

import UIKit

struct RecomWordModel {
    let word: String
}

extension RecomWordModel {
    static func list() ->  [RecomWordModel] {
        return [
            RecomWordModel(word: "채원 슈프림 후리스"),
            RecomWordModel(word: "나이키V2K런"),
            RecomWordModel(word: "뉴발란스996"),
            RecomWordModel(word: "신상 나이키 콜라보"),
            RecomWordModel(word: "허그 FW 패딩"),
            RecomWordModel(word: "벨루어 눕시")
        ]
    }
}
