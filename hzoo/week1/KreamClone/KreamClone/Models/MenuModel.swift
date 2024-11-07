//
//  MenuModel.swift
//  KreamClone
//
//  Created by 이현주 on 10/31/24.
//

import UIKit

struct MenuModel {
    let image: UIImage
    let name: String
}

extension MenuModel {
    static func list() ->  [MenuModel] {
        return [
            MenuModel(image: .크림드로우, name: "크림 드로우"),
            MenuModel(image: .실시간차트, name: "실시간 차트"),
            MenuModel(image: .남성추천, name: "남성 추천"),
            MenuModel(image: .여성추천, name: "여성 추천"),
            MenuModel(image: .색다른추천, name: "색다른 추천"),
            MenuModel(image: .정가아래, name: "정가 아래"),
            MenuModel(image: .윤세24AW, name: "윤세 24AW"),
            MenuModel(image: .올해의베스트, name: "올해의 베스트"),
            MenuModel(image: .베네핏, name: "10월 베네핏"),
            MenuModel(image: .아크네선물, name: "아크네 선물")
        ]
    }
}

