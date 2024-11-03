//
//  HOMEModel.swift
//  Kream
//
//  Created by KoNangYeon on 10/31/24.
//

import Foundation
import UIKit

struct HOMEModel {
    let image: UIImage
    let name: String
}

extension HOMEModel {
    static func dummy() -> [HOMEModel]{
        return [
            HOMEModel(image: .home1, name: "크림 드로우"),
            HOMEModel(image: .home2, name: "실시간 차트"),
            HOMEModel(image: .home3, name: "남성 추천"),
            HOMEModel(image: .home4, name: "여성 추천"),
            HOMEModel(image: .home5, name: "색다른 추천"),
            HOMEModel(image: .home6, name: "정가 아래"),
            HOMEModel(image: .home7, name: "윤세 24AW"),
            HOMEModel(image: .home8, name: "올해의 베스트"),
            HOMEModel(image: .home9, name: "10월 베네핏"),
            HOMEModel(image: .home10, name: "아크네 선물"),
        ]
    }
}

struct HOMEModel2 {
    let image: UIImage
    let title: String
    let smallTitle: String
    let counts: String
    let price: String
    let saveImage: UIImage
    let realPrice: String = "즉시 구매가"
}

extension HOMEModel2 {
    static func dummy() -> [HOMEModel2]{
        return [
            HOMEModel2(image: .home11, title: "MLB", smallTitle: "청키라이너 뉴욕양키스", counts: "거래 12.8만", price: "139,000원", saveImage: .notsaved),
            HOMEModel2(image: .home12, title: "Jordan", smallTitle: "Jordan 1 Retro High OG Yellow Ochre", counts: "거래 15.6만", price: "228,000원", saveImage: .saved),
            HOMEModel2(image: .home13, title: "Jordan", smallTitle: "Human Made x Kaws Varsity Jacket #1 Black", counts: "거래 17만", price: "2,000,000원", saveImage: .notsaved),
            HOMEModel2(image: .home13, title: "Jordan", smallTitle: "Human Made x Kaws Varsity Jacket #1 Black", counts: "거래 17만", price: "2,000,000원", saveImage: .notsaved)
        ]
    }
}

struct HOMEModel3 {
    let image: UIImage
    let instaId: String
}

extension HOMEModel3 {
    static func dummy()-> [HOMEModel3]{
        return [
            HOMEModel3(image: .home31, instaId: "@katarinabluu"),
            HOMEModel3(image: .home32, instaId: "@imwinter"),
            HOMEModel3(image: .home33, instaId: "@thousand_wooo"),
            HOMEModel3(image: .home31, instaId: "@katarinabluu")
        ]
    }
}
