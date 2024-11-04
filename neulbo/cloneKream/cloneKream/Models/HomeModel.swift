//
//  HomeModel.swift
//  cloneKream
//
//  Created by 김서현 on 10/31/24.
//

import UIKit

struct HomeMenuModel {
    let image: UIImage
    let title: String
}

extension HomeMenuModel {
    static func dummy() -> [HomeMenuModel] {
        return [
            HomeMenuModel(image: .menu1, title: "크림 드로우"),
            HomeMenuModel(image: .menu2, title: "실시간 차트"),
            HomeMenuModel(image: .menu3, title: "남성 추천"),
            HomeMenuModel(image: .menu4, title: "여성 추천"),
            HomeMenuModel(image: .menu5, title: "색다른 추천"),
            HomeMenuModel(image: .menu6, title: "정가 아래"),
            HomeMenuModel(image: .menu7, title: "윤세 24AW"),
            HomeMenuModel(image: .menu8, title: "올해의 베스트"),
            HomeMenuModel(image: .menu9, title: "10월 베네핏"),
            HomeMenuModel(image: .menu10, title: "아크네 선물")
        ]
    }
}

struct JustDroppedModel {
    let image: UIImage
    let productName: String
    let brandName: String
    let price: Int
    let tradingRate: Float
}

extension JustDroppedModel {
    static func dummy() -> [JustDroppedModel] {
        return [
            JustDroppedModel(image: .jd1, productName: "청키라이너 뉴욕양키스", brandName: "MLB", price: 139000, tradingRate: 12.8),
            JustDroppedModel(image: .jd2, productName: "Jordan 1 Retro High OG Yellow Ochre", brandName: "Jordan", price: 228000, tradingRate: 15.6),
            JustDroppedModel(image: .jd3, productName: "Human Made x Kaws Varsity Jacket #1 Black", brandName: "Human Made", price: 2000000, tradingRate: 1.2)
        ]
    }
}


struct ChallengeModel {
    let image: UIImage
    let userId: String
}

extension ChallengeModel {
    static func dummy() -> [ChallengeModel] {
        return [
            ChallengeModel(image: .ch1, userId: "@katarinabluu"),
            ChallengeModel(image: .ch2, userId: "@imwinter"),
            ChallengeModel(image: .ch3, userId: "@thousand_wooo")
        ]
    }
}
