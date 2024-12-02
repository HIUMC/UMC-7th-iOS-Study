//
//  JustDropModel.swift
//  Kream
//
//  Created by 어진 on 11/4/24.
//

import Foundation

struct JustDroppedModel {
    let image: String // URL 문자열로 변경
    let name: String
    let description: String
    let price: Int
}

final class DummyJustDroppedData {
    static let items: [JustDroppedModel] = [
        JustDroppedModel(
            image: "https://media.bunjang.co.kr/product/253789329_1_1708320182_w360.jpg",
            name: "손오공이 잃어버린 머리띠 반쪽",
            description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어디가 숨겨둔 역사 속 물건!!",
            price: 942192000
        ),
        JustDroppedModel(
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR62jxItHPT9bmtpdh2QwpPgHOZFcKRx82s8g&s",
            name: "골드 반지",
            description: "결혼 준비하는 당신?! 약혼녀에게 이 반지를 선물하는 건 어때요?!",
            price: 12000
        ),
        JustDroppedModel(
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR53E45ve9keEAY7rwSuzUe32cAAI0yfb_4wg&s",
            name: "하얀 신발",
            description: "짱둥 나이키 신발! 정말 폭신폭신해서 걷다가 줄러서 넘어지지...",
            price: 90000
        ),
        JustDroppedModel(
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR62jxItHPT9bmtpdh2QwpPgHOZFcKRx82s8g&s",
            name: "골드 반지",
            description: "결혼 준비하는 당신?! 약혼녀에게 이 반지를 선물하는 건 어때요?!",
            price: 12000
        ),
        JustDroppedModel(
            image: "https://media.bunjang.co.kr/product/253789329_1_1708320182_w360.jpg",
            name: "손오공이 잃어버린 머리띠 반쪽",
            description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어디가 숨겨둔 역사 속 물건!!",
            price: 942192000
        ),
        JustDroppedModel(
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR62jxItHPT9bmtpdh2QwpPgHOZFcKRx82s8g&s",
            name: "골드 반지",
            description: "결혼 준비하는 당신?! 약혼녀에게 이 반지를 선물하는 건 어때요?!",
            price: 12000
        ),
        JustDroppedModel(
            image: "https://image-cdn.trenbe.com/productmain/1651309486695-f13d28b7-3540-4dd0-ac8e-ca9f35fa2639.jpeg",
            name: "에베레스트 다이아 반지",
            description: "에베레스트 올라가서 다이아 구하고 만든 반지,,, 과연 이것을 누가 사줄것인가??",
            price: 1292999000
        ),
        JustDroppedModel(
            image: "https://media.bunjang.co.kr/product/253789329_1_1708320182_w360.jpg",
            name: "손오공이 잃어버린 머리띠 반쪽",
            description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어디가 숨겨둔 역사 속 물건!!",
            price: 942192000
        ),
        JustDroppedModel(
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR62jxItHPT9bmtpdh2QwpPgHOZFcKRx82s8g&s",
            name: "골드 반지",
            description: "결혼 준비하는 당신?! 약혼녀에게 이 반지를 선물하는 건 어때요?!",
            price: 12000
        ),
        JustDroppedModel(
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_uC9XryFJgmUmsbmAr3KuL9VQ_DkVgMn8w&s",
            name: "아디다스다 신발",
            description: "아디다스 처럼 보이지만 아디다스가 아닙지. 도 모르는 신발 이 신발의 주인은 너야~~",
            price: 120000
        )
    ]
}
