//
//  TeenipingModel.swift
//  week4 실습
//
//  Created by 이태림 on 10/31/24.
//

import UIKit

struct TeenipingModel {
    let image: UIImage
    let name: String
}

extension TeenipingModel {
    static func dummy() -> [TeenipingModel] {
        return [
            TeenipingModel(image: .hachuping, name: "하츄핑"),
            TeenipingModel(image: .lalaping, name: "라라핑"),
            TeenipingModel(image: .baroping, name: "바로핑"),
            TeenipingModel(image: .azaping, name: "아자핑"),
            TeenipingModel(image: .chachaping, name: "차차핑"),
            TeenipingModel(image: .haeping, name: "해핑"),
            TeenipingModel(image: .muguaping, name: "무거핑"),
            TeenipingModel(image: .siruping, name: "시러핑")
        ]
    }
}
