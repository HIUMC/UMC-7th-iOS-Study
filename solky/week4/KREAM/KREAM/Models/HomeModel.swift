//
//  HomeModel.swift
//  KREAM
//
//  Created by 이태림 on 10/31/24.
//

import UIKit

struct HomeModel {
    let image: UIImage
    let name: String
}

extension HomeModel {
    static func dummy() -> [HomeModel] {
        return [
            HomeModel(image: .kreamdraw, name: "크림 드로우"),
            HomeModel(image: .chart, name: "실시간 차트"),
            HomeModel(image: .male, name: "남성 추천"),
            HomeModel(image: .female, name: "여성 추천"),
            HomeModel(image: .different, name: "색다른 추천"),
            HomeModel(image: .sale, name: "정가 아래"),
            HomeModel(image: ._24Aw, name: "윤세 24AW"),
            HomeModel(image: .best1, name: "올해의 베스트"),
            HomeModel(image: .benefit, name: "10월 베네핏"),
            HomeModel(image: .acne, name: "아크네 선물")
        ]
    }
}
