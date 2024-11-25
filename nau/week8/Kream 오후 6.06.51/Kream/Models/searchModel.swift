//
//  searchModel.swift
//  Kream
//
//  Created by KoNangYeon on 11/20/24.
//

import Foundation

struct searchModel {
    let product: String
}

extension searchModel {
    static func dummy() -> [searchModel] {
        return [
            searchModel(product: "써넥트 Backpack"),
            searchModel(product: "페스토 패디드 자켓"),
            searchModel(product: "테켓 자켓 블랙"),
            searchModel(product: "고요웨어 에어리 후디"),
            searchModel(product: "썬러브 플리스 캡"),
        ]
    }
}
