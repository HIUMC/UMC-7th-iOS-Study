//
//  MenuModel.swift
//  MyKream
//
//  Created by 김호성 on 2024.10.30.
//

import Foundation
import UIKit

struct CircleModel {
    let image: UIImage
    let title: String
}

extension CircleModel {
    static func dummy() -> [CircleModel] {
        return [
            CircleModel(image: UIImage(named: "menu0.png")!, title: "크림 드로우"),
            CircleModel(image: UIImage(named: "menu1.png")!, title: "실시간 차트"),
            CircleModel(image: UIImage(named: "menu2.png")!, title: "남성 추천"),
            CircleModel(image: UIImage(named: "menu3.png")!, title: "여성 추천"),
            CircleModel(image: UIImage(named: "menu4.png")!, title: "색다른 추천"),
            CircleModel(image: UIImage(named: "menu5.png")!, title: "정가 아래"),
            CircleModel(image: UIImage(named: "menu6.png")!, title: "윤세 24AW"),
            CircleModel(image: UIImage(named: "menu7.png")!, title: "올해의 베스트"),
            CircleModel(image: UIImage(named: "menu8.png")!, title: "10월 베네핏"),
            CircleModel(image: UIImage(named: "menu9.png")!, title: "아크네 선물"),
        ]
    }
}
