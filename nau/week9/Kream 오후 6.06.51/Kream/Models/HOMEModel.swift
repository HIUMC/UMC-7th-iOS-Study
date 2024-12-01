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
    let color: UIColor
    let image: UIImage
    let title: String
    let smallTitle: String
    let counts: String
    let price: String
    let realPrice: String = "즉시 구매가"
}

extension HOMEModel2 {
    static func dummy() -> [HOMEModel2]{
        return [
            HOMEModel2(color: UIColor(hue: 0.5, saturation: 0.02, brightness: 0.94, alpha: 1.0),image: .home11, title: "MLB", smallTitle: "청키라이너 뉴욕양키스", counts: "거래 12.8만", price: "139,000원"),
            HOMEModel2(color: UIColor(hue: 0.0139, saturation: 0.04, brightness: 0.96, alpha: 1.0), image: .home12, title: "Jordan", smallTitle: "Jordan 1 Retro High OG Yellow Ochre", counts: "거래 15.6만", price: "228,000원"),
            HOMEModel2(color: UIColor(hue: 0, saturation: 0, brightness: 0.96, alpha: 1.0), image: .home13, title: "Jordan", smallTitle: "Human Made x Kaws Varsity Jacket #1 Black", counts: "거래 17만", price: "2,000,000원"),
            HOMEModel2(color: UIColor(hue: 0, saturation: 0, brightness: 0.96, alpha: 1.0), image: .home13, title: "Jordan", smallTitle: "Human Made x Kaws Varsity Jacket #1 Black", counts: "거래 17만", price: "2,000,000원")
        ]
    }
}

struct HOMEModel3 {
    let imageURL : String
    let instaId: String
}

extension HOMEModel3 {
    static func dummy()-> [HOMEModel3]{
        return [
            HOMEModel3(imageURL: "https://cdn.newsculture.press/news/photo/202310/534270_665658_1442.jpg", instaId: "@katarinabluu"),
            HOMEModel3(imageURL: "https://pimg.mk.co.kr/news/cms/202408/31/news-p.v1.20240831.a99cdc5c002d4bcc8532ae7f50d5d65e_R.jpg", instaId: "@imwinter"),
            HOMEModel3(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4T-UcqHodrPr3xbz-uBgcVdUkxyz5-5UoAA&s", instaId: "@natty"),
            HOMEModel3(imageURL: "https://phinf.wevpstatic.net/MjAyMzExMDFfOTcg/MDAxNjk4ODQ2ODQzNTY0.Nuioq7_bgMb446-PQeEkrMsWi3-Oui54oRUeQkrS0tcg.OUYfYrrN2sFnycN540tUuht9K9BOvqC7QFfB35HpbMEg.JPEG/image.jpgE", instaId: "@Yushi_1"),
            HOMEModel3(imageURL: "https://i.namu.wiki/i/PDR2F1c9naoXcKRI74oRFrpWSXBH-V1NY5sQfEW9HwzfTL1jVx0yrwFlOnO2L-nTZlsea6nDAhaE50BCt_IhLg.webp", instaId: "@キルア＝ゾルディック"),
            HOMEModel3(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQITJlefzjd4AxymsOALrhpDFkjJo1i7gtSRA&s", instaId: "@Moka_1"),
            HOMEModel3(imageURL: "https://api.nudge-community.com/attachments/6016550", instaId: "@Iroha_1"),
            HOMEModel3(imageURL: "https://pbs.twimg.com/media/GSsm2CPbIAA_Z50.jpg", instaId: "@Yushi_2"),
            HOMEModel3(imageURL: "https://archive.myvibrary.com/thumb/1722228945156_31226f8967.jpeg?d=1080", instaId: "@Moka_2"),
            HOMEModel3(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmzhlnGEE24AGQ281CPud1EBHe7STzQZQn7A&s", instaId: "@Iroha_2")
        ]
    }
}


