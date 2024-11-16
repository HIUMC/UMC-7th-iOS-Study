//
//  ProductModel.swift
//  Kream
//
//  Created by KoNangYeon on 10/14/24.
//

import Foundation
import UIKit

struct ProductModel {
    var productImage : String?
    var productName : String?
    var productDetail : String?
    var productPrice : String?
    var saveImage : String?
}

final class dummyProductModels {
    static let productDates: [ProductModel] = [
        ProductModel(productImage: "image 1", productName: "손오공이 잃어버린 머리띠 반쪽", productDetail:"""
손오공이 장난치다가 머리띠 반쪽 잘라서 어\n딘가 숨겨둔 역사속 물건!!
""", productPrice: "942,192,000원", saveImage: "찜하기 버튼"),
        ProductModel(productImage: "image 2", productName: "골드 반지", productDetail: """
결혼 준비하는 당신?!
약혼녀에게 이 반지를 선물하는 건 어때요?!
""", productPrice: "12,000원", saveImage: "찜하기 버튼"),
        ProductModel(productImage: "image 3", productName: "하얀 신발", productDetail: """
짝퉁 나이키 신발!
정말 푹신푹신해서 걷다가 졸려서 넘어지...
""", productPrice: "90,000원", saveImage: "찜하기 버튼"),
        ProductModel(productImage: "image 4", productName: "에베레스트 다이아 반지",  productDetail: """
에베레스트 올라가서 다이아 구하고 만든
반지,,! 과연 이것을 누가 사갈것인가??
""", productPrice: "1,292,999,000원", saveImage: "찜하기 버튼"),
        ProductModel(productImage: "image 5", productName: "아디다스다 신발", productDetail: """
아디다스 처럼 보이지만 아디다스가 아닐지
도 모르는 신발 이 신발의 주인은 너야~~
""",  productPrice: "120,000원", saveImage: "찜하기 버튼"),
        ProductModel(productImage: "image 6", productName: "황제 잠옷", productDetail: """
어느 나라의 황제가 입었다던 잠옷
크리스마스 트리같이 보이는 디자인!
""", productPrice: "120,000,000원", saveImage: "찜하기 버튼"),
        ProductModel(productImage: "image 7", productName: "고장난 기타", productDetail: """
블라블라블라블라
블라블라블라블라블라
""", productPrice: "120,000원", saveImage: "찜하기 버튼"),
        ProductModel(productImage: "image 8", productName: "하얀 음료", productDetail: """
이 음료를 마시면 건강해져요
근데 어디가 건강해질까요? 한 번 마셔겠.....
""", productPrice: "120,000원", saveImage: "찜하기 버튼"),
        ProductModel(productImage: "image 1", productName: "손오공이 잃어버린 머리띠 반쪽", productDetail:"""
손오공이 장난치다가 머리띠 반쪽 잘라서 어\n딘가 숨겨둔 역사속 물건!!
""", productPrice: "942,192,000원", saveImage: "찜하기 버튼"),
        ProductModel(productImage: "image 2", productName: "골드 반지", productDetail: """
결혼 준비하는 당신?!
약혼녀에게 이 반지를 선물하는 건 어때요?!
""", productPrice: "12,000원", saveImage: "찜하기 버튼")
    ]
}
