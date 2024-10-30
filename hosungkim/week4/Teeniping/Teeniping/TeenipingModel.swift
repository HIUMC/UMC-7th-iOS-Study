//
//  TeenipingModel.swift
//  Teeniping
//
//  Created by 김호성 on 2024.10.29.
//

import Foundation
import UIKit

struct TeenipingModel {
    let image: UIImage
    let name: String
}

extension TeenipingModel {
    static func dummy() -> [TeenipingModel] {
        return [
            TeenipingModel(image: UIImage(named: "heartsping.png")!, name: "하츄핑"),
            TeenipingModel(image: UIImage(named: "lalaping.png")!, name: "라라핑"),
            TeenipingModel(image: UIImage(named: "dadaping.png")!, name: "바로핑"),
            TeenipingModel(image: UIImage(named: "gogoping.png")!, name: "아자핑"),
            TeenipingModel(image: UIImage(named: "chachaping.png")!, name: "차차핑"),
            TeenipingModel(image: UIImage(named: "happying.png")!, name: "해핑"),
            TeenipingModel(image: UIImage(named: "heavyping.png")!, name: "무거핑"),
            TeenipingModel(image: UIImage(named: "nonoping.png")!, name: "시러핑"),
        ]
    }
}
