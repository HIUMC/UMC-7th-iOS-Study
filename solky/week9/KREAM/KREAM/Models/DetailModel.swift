//
//  DetailModel.swift
//  KREAM
//
//  Created by 이태림 on 11/11/24.
//

import UIKit

struct DetailModel {
    let image: String
}

extension DetailModel {
    static func detaildummy() -> [DetailModel] {
        return [
            DetailModel(image: "matinkim1.png"),
            DetailModel(image: "matinkim2.png"),
            DetailModel(image: "matinkim3.png"),
            DetailModel(image: "matinkim4.png"),
            DetailModel(image: "matinkim5.png"),
            DetailModel(image: "matinkim6.png"),
            DetailModel(image: "matinkim7.png"),
        ]
    }
}
