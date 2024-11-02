//
//  TeenipingModel.swift
//  TeeniepingCollection
//
//  Created by 이현주 on 10/30/24.
//

import Foundation
import UIKit

struct TeenipingModel {
    let image: UIImage
    let name: String
}

extension TeenipingModel {
    static func dumy() ->  [TeenipingModel] {
        return [
            TeenipingModel(image: .하츄핑, name: "하츄핑"),
            TeenipingModel(image: .라라핑, name: "라라핑"),
            TeenipingModel(image: .바로핑, name: "바로핑"),
            TeenipingModel(image: .아자핑, name: "아자핑"),
            TeenipingModel(image: .차차핑, name: "차차핑"),
            TeenipingModel(image: .해핑, name: "해핑"),
            TeenipingModel(image: .무거핑, name: "무거핑"),
            TeenipingModel(image: .시러핑, name: "시러핑")
        ]
    }
}
