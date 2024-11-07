//
//  SavedModel.swift
//  cloneKream
//
//  Created by 김서현 on 10/30/24.
//

import UIKit

struct SavedModel {
    let name: String
    let explanation: String
    let price: Int
    let image: UIImage?
}

extension SavedModel {
    static func dummy() -> [SavedModel] {
        return [
            SavedModel(name: "손오공이 잃어버린 머리띠 반쪽", explanation: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사 속 물건!", price: 942192000, image: UIImage(named: "image1")),
            SavedModel(name: "골드 반지", explanation: "결혼 준비하는 당신?!\n약혼녀에게 이 반지를 선물하는 건 어때요?!", price: 12000, image: UIImage(named: "image2")),
            SavedModel(name: "하얀 신발", explanation: "짝퉁 나이키 신발!\n정말 푹신푹신해서 걷다가 졸려서 넘어지..", price: 90000, image: UIImage(named: "image3")),
            SavedModel(name: "에베레스트 다이아 반지", explanation: "에베레스트 올라가서 다이아 구하고 만든 반지,,! 과연 이것을 누가 사갈것인가??", price: 1292999000, image: UIImage(named: "image4")),
            SavedModel(name: "아디다스다 신발", explanation: "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~", price: 120000, image: UIImage(named: "image5")),
            SavedModel(name: "황제 잠옷", explanation: "어느 나라의 황제가 입었다던 잠옷 크리스마스 트리같이 보이는 디자인!", price: 120000000, image: UIImage(named: "image6")),
            SavedModel(name: "고장난 기타", explanation: "blah blah blah", price: 120000, image: UIImage(named: "image7")),
            SavedModel(name: "하얀 음료", explanation: "이 음료를 마시면 건강해져요\n근데 어디가 건강해질까요? 한 번 마셔보겠....", price: 942192000, image: UIImage(named: "image8")),
            SavedModel(name: "우리 집 토끼", explanation: "아주 귀여운 토끼이다.", price: 10000, image: UIImage(named: "image9")),
            SavedModel(name: "우리 집 멍구", explanation: "아주 귀여운 강아지이다.", price: 942000, image: UIImage(named: "image10")),
            SavedModel(name: "묘냥", explanation: "고양이다.", price: 942192000, image: UIImage(named: "image11"))
        ]
    }
}
