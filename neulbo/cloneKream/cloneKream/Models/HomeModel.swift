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
    let image: String
    let productName: String
    let brandName: String
    let price: Int
    let tradingRate: Float
}

extension JustDroppedModel {
    static func dummy() -> [JustDroppedModel] {
        return [
            JustDroppedModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZmD7cryIDs5QzdEztRwiSJsc0ZvCo8L1ehg&s", productName: "아디다스 와플 베켄바우어 트랙탑 원더 화이트", brandName: "Adidas", price: 150000, tradingRate: 1.6),
            JustDroppedModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3Wbat0FnDLBcUrItnxJWiQKGwxgX8JAexrQ&s", productName: "아디다스 퍼피렛 삼바 코어 블랙", brandName: "Adidas", price: 56000, tradingRate: 15.6),
            JustDroppedModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzmu25FtpDCCWAN3zpiLG7QVRkD8YY2jIzig&s", productName: "산리오 헬로 키티 갈 쿠마 마스코트 키체인", brandName: "Sanrio", price: 76000, tradingRate: 1.2),
            JustDroppedModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpVb47Nz5P4bagfYCYH6HceQNlTgSI2SV8xQ&s", productName: "산리오 헬로 키티 갈 쿠마 마스코트 키체인", brandName: "Sanrio", price: 70000, tradingRate: 19),
            JustDroppedModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0Dl98Dc7iqelMcTtPkM1mUrcGsRGA_O5BDQ&s", productName: "라츠유 노스텔지아 츄비 백팩 핑크", brandName: "LOTS YOU", price: 109600, tradingRate: 3.4),
            JustDroppedModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOTbLEDnesrt5oZPAvgsY1RkSEZMV_elUv7Q&s", productName: "아디다스 럭색 블랙", brandName: "Adidas", price: 62000, tradingRate: 5.5),
            JustDroppedModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFQDPOP0VL7x6jkMIDw-4BnQvOZ0cd0G_5mg&s", productName: "(W) 어그 맥시 컬리 플랫폼 슬리퍼 샌드", brandName: "UGG", price: 156000, tradingRate: 111.2),
            JustDroppedModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWeFXCxQwLYvDUKPx7-luyh6DHddk-EtI7yA&s", productName: "마뗑킴 로고 자카드 숏 비니 화이트", brandName: "Adidas", price: 56000, tradingRate: 1.1),
            JustDroppedModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfgd5hzVXBsyA7cNI59CKXN-nXA1eKrkq6zA&s", productName: "오와이 헤어리 링 니트 글러브 블랙", brandName: "OY", price: 39560, tradingRate: 4.3),
            JustDroppedModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOccMlECcQOJjuQJacXtusdY8TCHRy26N79Q&s", productName: "조던 x 트래비스 스캇 티셔츠 다크 스모크 그레이", brandName: "Jordan", price: 105000, tradingRate: 10.2),
            JustDroppedModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi1e2QZc92GECQrzdaWUOGr758eTWcPrLFTw&s", productName: "스투시 베이직 스투시 후드 애쉬 헤더 2024", brandName: "Stussy", price: 190000, tradingRate: 10.2)
        ]
    }
}


struct ChallengeModel {
    let image: String
    let userId: String
}

extension ChallengeModel {
    static func dummy() -> [ChallengeModel] {
        return [
            ChallengeModel(image: "https://postfiles.pstatic.net/MjAyNDExMjBfMTAx/MDAxNzMyMDY1MTQ0MDE2.o5l2RjBVx3cLZeR6lIpuBvQgc_sw62jJxlkD3bBcYvUg.BEFY7wbURXqzpVgDRleQHzI3L7sKBDbMoUcODInLlqYg.JPEG/KakaoTalk_20241120_100903656_03.jpg?type=w966", userId: "@katarinabluu"),
            ChallengeModel(image: "https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F5090%2F2024%2F02%2F27%2F0002340589_001_20240227154002837.png&type=a340", userId: "@katarinabluu"),
            ChallengeModel(image: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA4MDVfMjA2%2FMDAxNzIyODQ3MjI1NTc5.3-k6nJTo2BK_X1Q1QQJx-kDplKyNey46fVmaJaZWL04g.FzxaVjwOQZ9NO9fV0abFROEj-9nZOfZszUl8xO66I_Ig.JPEG%2FKakaoTalk_20240805_173951132_03.jpg&type=a340", userId: "@imwinter"),
            ChallengeModel(image: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA1MTZfMzAw%2FMDAxNjIxMTUyMjc1MTY4.DSJhaRMdoerGdpf5-rH4BMn-D7p0p6HF-eAzslHiOHwg.o1kAaqy88po2cSMCZdYySekcvjOR-qHkf8IC4E5aJwIg.JPEG.sun__set%2Foutput_100964032.jpg&type=a340", userId: "@rosies_are_rose"),
            ChallengeModel(image: "https://postfiles.pstatic.net/MjAyNDA5MTFfNjUg/MDAxNzI2MDMwMTY4NTMx.Tg89wECUqdRz0SVi2EhsIl13815WqmpibAjFDzANlgMg._RU3ongjX1y4XW9jZQqJqABqmX0FGJkssr4LR52BYX0g.JPEG/KakaoTalk_20240911_133915329_03.jpg?type=w966", userId: "@imnotningning"),
            ChallengeModel(image: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA0MjBfNTcg%2FMDAxNjgxOTk3NTA4MTA1.dt5goZlJO_8q30LXQQmmwtT1st1_8-F_tyRA1v1GnD4g.bUzjhyXugNi8_TN8FR4tr2XtWs0ONxF3fMS3bvyh3msg.JPEG.classyclikey%2FIMG_6859.JPG&type=a340", userId: "@imnotningning"),
            ChallengeModel(image: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA1MDVfMTE4%2FMDAxNzE0OTE1OTc0NjM1.QkgRbgTpHlcKEcZNITyO1A83s0bMkm9Dhc7-_gNhH48g.JCwJ4C8-8obJGxygSxYFv7sTwbymOafge-ZyHM7mD5Mg.JPEG%2FSeul_%25C4%25AB%25B8%25AE%25B3%25AA_%25C6%25AE%25C0%25AD1258.jpg&type=ofullfill340_600_png", userId: "@katarinabluu"),
            ChallengeModel(image: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA1MjFfNDIg%2FMDAxNzE2MjgxNzUxMzIy.r9_9Lu1mmYUptyU89JfnFVUuocFtMFbmJMz-5YNV5xMg.PBd2gjPj81Ild-nIzYC8BIb2LwjZKQf_C7p9vbH9NWUg.JPEG%2F1716281751029.jpg&type=a340", userId: "@aerichandesu"),
            ChallengeModel(image: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEyMjVfMTY5%2FMDAxNzAzNDk3MzUzMTI1.qsHr1n8N70GGxVEz4-6FmI0kX8tCtjzEvUHWkPoTL2Qg.0_LMNMisszgMkCO7SQFDMRJ6i7wdzr6D_RA7b-mVkmog.PNG.rlaalsdn0034%2FIMG_6041.PNG&type=a340", userId: "@for_everyoung10"),
            ChallengeModel(image: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTEwMDhfMjUx%2FMDAxNjMzNjMwNTYzMTc0.d7AlMsT6wJbDU-er-lp4hp89nXkhqcqnxXOMqU-swOIg.6T8msN8DPxRyQnDjJBQVFwkcCg3ITu45JLHngaWBg5Mg.JPEG.in_korean_style%2F244013424_847927672585464_7838679996377239538_n.jpg&type=a340", userId: "@_yujin_an")
        ]
    }
}
