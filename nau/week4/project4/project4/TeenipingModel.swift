//
//  TeenpingModel.swift
//  project4
//
//  Created by KoNangYeon on 10/31/24.
//

import UIKit

struct TeenipingModel{
    let image: UIImage
    let name: String
}

extension TeenipingModel {
    static func dummy() -> [TeenipingModel]{
        return [
            TeenipingModel(image: .hachu, name: "하츄핑"),
            TeenipingModel(image: .lala, name: "라라핑"),
            TeenipingModel(image: .baro, name: "바로핑"),
            TeenipingModel(image: .aja, name: "아자핑"),
            TeenipingModel(image: .chacha, name: "차차핑"),
            TeenipingModel(image: .happy, name: "해핑"),
            TeenipingModel(image: .mug, name: "무거핑"),
            TeenipingModel(image: .siru, name: "시러핑"),
        ]
    }
}
