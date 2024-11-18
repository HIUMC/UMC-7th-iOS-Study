//
//  ProductModel.swift
//  KREAM
//
//  Created by 주민영 on 10/13/24.
//

import Foundation

struct ProductModel {
    let productImage: String
    let productTitle: String
    let productSubTitle: String
    let productPrice: String
}

final class dummyProductModel {
    static let productDatas: [ProductModel] = [
        ProductModel(productImage: "product-1.png", productTitle: "손오공이 잃어버린 머리띠 반쪽", productSubTitle: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!", productPrice: "942,192,000원"),
        ProductModel(productImage: "product-2.png", productTitle: "골드 반지", productSubTitle: "결혼 준비하는 당신?!\n약혼녀에게 이 반지를 선물하는 건 어때요?!", productPrice: "12,000원"),
        ProductModel(productImage: "product-3.png", productTitle: "하얀 신발", productSubTitle: "짝퉁 나이키 신발!\n정말 푹신푹신해서 걷다가 졸려서 넘어지...", productPrice: "90,000원"),
        ProductModel(productImage: "product-4.png", productTitle: "에베레스트 다이아 반지", productSubTitle: "에베레스트 올라가서 다이아 구하고 만든 반지,,! 과연 이것을 누가 사갈것인가??", productPrice: "1,292,999,000원"),
        ProductModel(productImage: "product-5.png", productTitle: "아디다스다 신발", productSubTitle: "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~", productPrice: "120,000원"),
        ProductModel(productImage: "product-6.png", productTitle: "황제 잠옷", productSubTitle: "어느 나라의 황제가 입었다던 잠옷\n크리스마스 트리같이 보이는 디자인!", productPrice: "120,000,000원"),
        ProductModel(productImage: "product-7.png", productTitle: "고장난 기타", productSubTitle: "블라블라블라블라\n블라블라블라블라블라", productPrice: "120,000원"),ProductModel(productImage: "product-1.png", productTitle: "손오공이 잃어버린 머리띠 반쪽", productSubTitle: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!", productPrice: "942,192,000원"),
        ProductModel(productImage: "product-2.png", productTitle: "골드 반지", productSubTitle: "결혼 준비하는 당신?!\n약혼녀에게 이 반지를 선물하는 건 어때요?!", productPrice: "12,000원"),
        ProductModel(productImage: "product-3.png", productTitle: "하얀 신발", productSubTitle: "짝퉁 나이키 신발!\n정말 푹신푹신해서 걷다가 졸려서 넘어지...", productPrice: "90,000원")
    ]
}
