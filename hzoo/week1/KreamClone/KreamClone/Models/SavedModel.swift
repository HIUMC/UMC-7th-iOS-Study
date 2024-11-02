//
//  SavedModel.swift
//  KreamClone
//
//  Created by 이현주 on 10/29/24.
//

import Foundation

struct SavedModel {
    let savedName: String
    let savedContents: String
    let savedAmount: String
}

final class dummySavedModel {
    static let savedDatas: [SavedModel] = [
        SavedModel(savedName: "손오공이 잃어버린 머리띠 반쪽", savedContents: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!", savedAmount: "942,192,000"),
        SavedModel(savedName: "골드 반지", savedContents: "결혼 준비하는 당신?!\n약혼녀에게 이 반지를 선물하는 건 어때요?!", savedAmount: "12,000"),
        SavedModel(savedName: "하얀 신발", savedContents: "짝퉁 나이키 신발!\n정말 푹신푹신해서 걷다가 졸려서 넘어지...", savedAmount: "90,000"),
        SavedModel(savedName: "에베레스트 다이아 반지", savedContents: "에베레스트 올라가서 다이아 구하고 만든 반지,,! 과연 이것을 누가 사갈것인가??", savedAmount: "1,292,999,000"),
        SavedModel(savedName: "아디다스 신발", savedContents: "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~", savedAmount: "120,000"),
        SavedModel(savedName: "황제 잠옷", savedContents: "어느 나라의 황제가 입었다던 잠옷\n크리스마스 트리같이 보이는 디자인!", savedAmount: "120,000,000"),
        SavedModel(savedName: "고장난 기타", savedContents: "블라블라블라블라\n블라블라블라블라블라", savedAmount: "120,000"),
        SavedModel(savedName: "하얀 음료", savedContents: "이 음료를 마시면 건강해져요\n근데 어디가 건강해질까요? 한 번 마셔겠.....", savedAmount: "120,000")
    ]
}

