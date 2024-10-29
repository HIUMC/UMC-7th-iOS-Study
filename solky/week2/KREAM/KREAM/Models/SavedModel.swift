//
//  SavedModel.swift
//  KREAM
//
//  Created by 이태림 on 10/29/24.
//

import Foundation

struct SavedModel
{
    let savedImage : String
    let savedTitle : String
    let savedExplain : String
    let savedPrice : String
    let savedScrapButton : String
}

final class dummySavedModel {
    static let savedDatas: [SavedModel] = [
        SavedModel(savedImage: "saved 1.png", savedTitle: "손오공이 잃어버린 머리띠 반쪽", savedExplain: "손오공이 장난치다가 머리띠 반쪽 잘라서 어 \n딘가 숨겨둔 역사속 물건!!", savedPrice: "942,192,000원", savedScrapButton: "scrapbutton.png"),
        SavedModel(savedImage: "saved 2.png", savedTitle: "골드 반지", savedExplain: "결혼 준비하는 당신?! \n약혼녀에게 이 반지를 선물하는 건 어때요?!", savedPrice: "12,000원", savedScrapButton: "scrapbutton.png"),
        SavedModel(savedImage: "saved 3.png", savedTitle: "하얀 신발", savedExplain: "짝퉁 나이키 신발! \n정말 푹신푹신해서 걷다가 졸려서 넘어지...", savedPrice: "90,000원", savedScrapButton: "scrapbutton.png"),
        SavedModel(savedImage: "saved 4.png", savedTitle: "에베레스트 다이아 반지", savedExplain: "에베레스트 올라가서 다이아 구하고 만든 \n반지,,! 과연 이것을 누가 사갈것인가??", savedPrice: "1,292,999,000원", savedScrapButton: "scrapbutton.png"),
        SavedModel(savedImage: "saved 5.png", savedTitle: "아디다스다 신발", savedExplain: "아디다스 처럼 보이지만 아디다스가 아닐지 \n도 모르는 신발 이 신발의 주인은 너야~~", savedPrice: "120,000원", savedScrapButton: "scrapbutton.png"),
        SavedModel(savedImage: "saved 6.png", savedTitle: "황제 잠옷", savedExplain: "어느 나라의 황제가 입었다던 잠옷 \n크리스마스 트리같이 보이는 디자인!", savedPrice: "120,000,000원", savedScrapButton: "scrapbutton.png"),
        SavedModel(savedImage: "saved 7.png", savedTitle: "고장난 기타", savedExplain: "블라블라블라블라 \n블라블라블라블라블라", savedPrice: "120,000원", savedScrapButton: "scrapbutton.png"),
        SavedModel(savedImage: "saved 8.png", savedTitle: "하얀 음료", savedExplain: "이 음료를 마시면 건강해져요 \n근데 어디가 건강해질까요? 한 번 마셔겠.....", savedPrice: "120,000원", savedScrapButton: "scrapbutton.png"),
        SavedModel(savedImage: "saved 9.png", savedTitle: "아파트", savedExplain: "로제와 브루노 마스가 그렇게나 소유하고 싶었던 아파트 \n지금이 마지막 기회!!", savedPrice: "999,999,999원", savedScrapButton: "scrapbutton.png"),
        SavedModel(savedImage: "saved 10.png", savedTitle: "아이폰 18pro", savedExplain: "미래에서 온 누군가가 쓰다 질려서 \n파는 아이폰 18pro 중고!!", savedPrice: "420,000,000원", savedScrapButton: "scrapbutton.png"),
        
    ]
}
