//
//  ProductCardModel.swift
//  KREAM
//
//  Created by 주민영 on 11/4/24.
//

import Foundation
import UIKit

struct ProductCardModel {
    let productImageURL: String
    let transaction: String
    let brand: String
    let nameEn: String
    let nameKo: String
    let productPrice: String
    let color: UIColor
}

extension ProductCardModel {
    static func dummy() -> [ProductCardModel] {
        return [
            ProductCardModel(productImageURL: "https://s3-alpha-sig.figma.com/img/3888/3485/40338332862dec62a2a1370c053f1e3d?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=keSrlZ4MTCiheZbY~A8jVjzZKKmH43n1mGW7aSZ54l0Y1qEKFSo-a5bv~NKMUZ9x3u9yaOLhQnuldMN-KnKZC5PM0v8hOcptra07z40Zkq8CjOt-5ju9aNoG2IjFShuZFSfWevo2AOKCHoblBNhvK6Zp5LPn34EykTbehIhm342Y4fPxceqX5QqNCAqZEr58C9Um6F0TkkbFu8eb33vvLF8FL7SgRpu1J6jG9~BraFjomNO6cz7NII4~T~bRWTLFGMQaB6cm46T8JdjQ0jXPP2gA3z0ntghVAnw9RfrPo-ZxY5z8w6hCYEJ9k96h3ukINrQC2ofLLrWAZVvMd7Mmiw__", transaction: "12.8", brand: "MLB", nameEn: "Chunky Liner New York Yankees", nameKo: "청키라이너 뉴욕양키스", productPrice: "139,000", color: UIColor(red: 234/255, green: 240/255, blue: 245/255, alpha: 1)),
            ProductCardModel(productImageURL: "https://s3-alpha-sig.figma.com/img/44e5/158d/85a822e2d9940249bee1e726f0fa4df1?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ePyG2YWpTiTYEdS05WEarX~XT-1Wyc8jz7VSQBmfWkzECS~f-914ZiCVL2a7vaFt8aH52HR-7bbud2q532hMnnCgT8GSl-FQ5IW~t7zx3iLcIq3CUeBU6~q9H4hTVZCgfkPwalmg-2xgSG5ttwlRlCjPNWIPadTpj9A0wwRgELLK4JMdbv3HY5r65GSY9d4fSd2204NFvS06L06xxdCcCOT2q8qrCWbyL59TwlaBlyFcPHi2xSkRKK2CVvq5LXBx--jKwCe4g6tW~DNKKZhGaWi4TSMDkgNUxGK7H~nUltZvrKKArhMTW1MIKmmINpdXD~QaobJckmQ-uwx7LnkJZQ__", transaction: "15.6", brand: "Jordan", nameEn: "Jordan 1 Retro High OG Yellow Ochre", nameKo: "조던 1 레트로 하이 OG 옐로우 오커", productPrice: "228,000", color: UIColor(red: 246/255, green: 237/255, blue: 236/255, alpha: 1)),
            ProductCardModel(productImageURL: "https://s3-alpha-sig.figma.com/img/6405/60ad/f845a3a967992652b95e739c468ce356?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Wje1MmGH4yCjvFOZHFjT097qG-cVibjD4rrzwX6Vjb0SH4h81NG0oG2o8SXJV2vbpLO6khh4EiVoP4V6pCaUN9re4l-gLg2DwsMg4Vp03mamC~3pCbEaXBdo1elZ50IDBgpQRg5YbgEKHHiIP8CshdcN2onp61-HK~OxWCqF50CWKym2yTmxx8xMOptLcDkiIEmVAPpVcFsA8opE7VPxmov~9syh5Hu2gId1lGNb91YCXDMMUG38cGa9W3njPqrPat1ETXi7WRFedtmcvELcwmwSLZcLV0eaO81XDACvQw15v~ibEUDkb-N-VbgS1ZurEj7p2yFMpr8z6865QckAog__", transaction: "12.8", brand: "Human Made", nameEn: "Human Made x Kaws Varsity Jacket #1 Black", nameKo: "휴먼 메이드 x 카우스 바시티 자켓 #1 블랙", productPrice: "2,000,000", color: .systemGray6),
            ProductCardModel(productImageURL: "https://s3-alpha-sig.figma.com/img/619b/ce54/04740c20958b83448efc55e88f0fc54c?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=I-B0JNTekFwut0ArdHadTNLZrSkUMoj7xOkwBhVXULYNZPuQC-w6y5j80HONBvxphxyRT~I19l6uH-OXtPzuvzQ~fCzNNo1Tcn~2KJVnLB7H1s-8EuthzpLMKMcW5WKquc5WN-fJn~lkyqJe~v~QOoghY5vhcbsJycx2L1k~yQjEWvf6N82zwOWNnqJMLRD64qsyR27pzzt5Owng13ysxMfLNrXUXz-gUv6EMl1r1kkfU7euX335NO5DpmZXh4~Cpf6h3YjPIAuPqRn0mPq8V5eMBY5hN8A2-hCU0fRYLux4GJ8KeNJGIJywfQJE3y~65knpCyf2TKKT2GR-Wy8pMw__", transaction: "13.1", brand: "Matin Kim", nameEn: "Matin Kim Logo Coating Jumper", nameKo: "마뗑킴 로고 코팅 점퍼 블랙", productPrice: "228,000", color: UIColor(red: 237/255, green: 243/255, blue: 236/255, alpha: 1)),
            ProductCardModel(productImageURL: "https://kream-phinf.pstatic.net/MjAyMjEyMjhfMjU1/MDAxNjcyMjE1NzM5MDk0.O6R326F7AC60LWouE3k4LcyI1PqAAztAfOTLs1NKHrgg.6SUlE81yMMikD4QPxS1x_SAkVvBMXHreO0dC-pyGnZkg.PNG/a_51e46c3a9969404387a255ea0c489331.png?type=l_webp", transaction: "38.1", brand: "UGG", nameEn: "UGG Mini Bailey Button II Boots Chestnut", nameKo: "어그 미니 베일리 버튼 2 부츠 체스트넛", productPrice: "150,000", color: UIColor(red: 234/255, green: 240/255, blue: 245/255, alpha: 1)),
            ProductCardModel(productImageURL: "https://kream-phinf.pstatic.net/MjAyMzA2MDlfMTgy/MDAxNjg2Mjc3MTAxNTUw.m4fteG-MpYVh_pn3s0K3APckgm4WGcUtzd3bCMQqwHYg.itdXfCHImFYg1Je6sAJRLL7sGcZjENOjTVoYqrbzUD8g.JPEG/a_cac0ba45e5044ed88ec8bae9d37126f1.jpg?type=l_webp", transaction: "50.1", brand: "COS", nameEn: "COS Quilted Messenger Bag Black", nameKo: "코스 퀼티드 메신저백 블랙", productPrice: "126,000", color: UIColor(red: 246/255, green: 237/255, blue: 236/255, alpha: 1)),
            ProductCardModel(productImageURL: "https://kream-phinf.pstatic.net/MjAyNDExMjBfMTkz/MDAxNzMyMDcwMjkwMDIy.M605AH0tcRjHpZuHeQi10lu84w6C_zjrByIvXAGQd1Eg.sju5ol-6bGApyNcKRNrhj-H_68Of7JWfy7X3PAfyrjEg.PNG/a_ff20cacf778641cab9e9b9f96c0de2aa.png?type=l_webp", transaction: "20.1", brand: "Jordan", nameEn: "Jordan 1 Retro Low OG Game Royal", nameKo: "조던 1 레트로 로우 OG 게임 로얄", productPrice: "185,000", color: .systemGray6),
            ProductCardModel(productImageURL: "https://kream-phinf.pstatic.net/MjAyNDAzMTJfMjM4/MDAxNzEwMjI2NTc4MTkx.Ht28rYdJsaEFcyvA8QNMaUOWl3psKheWKp7xkrKMJNkg.Mm7jD53T7zdk5Sm1b_TdY2gw9XS0y5VJglcrcQJqa6Qg.JPEG/a_3d68e54ded7545b19709754fb55fb8af.jpg?type=l_webp", transaction: "10.1", brand: "Stussy", nameEn: "Stussy New Era 9twenty Basic Trucker Black", nameKo: "스투시 뉴에라 9Twenty 베이직 트러커 블랙", productPrice: "78,000", color: UIColor(red: 246/255, green: 237/255, blue: 236/255, alpha: 1)),
            ProductCardModel(productImageURL: "https://kream-phinf.pstatic.net/MjAyNDEwMzFfNjMg/MDAxNzMwMzY0ODU4NTAy.hLKouPLo2yJjGHFCuFYWHq9AFESU9f-JcyP_h-6rXhkg.oX844VLCiECsW3UOpkqKqLOAFEbVwX8htPOt3HOwUHcg.PNG/p_9a53f658d4f04a4992d8a91b85e3b39b.png?type=l_webp", transaction: "16.1", brand: "Dairiku", nameEn: "Dairiku Surf Vintage Ski Blouson Dirt Brown - 24FW", nameKo: "다이리쿠 서프 빈티지 스키 블루종 더트 브라운 - 24FW", productPrice: "895,000", color: UIColor(red: 237/255, green: 243/255, blue: 236/255, alpha: 1)),
            ProductCardModel(productImageURL: "https://kream-phinf.pstatic.net/MjAyNDExMDdfMjAy/MDAxNzMwOTgxODc1NjIy.ltjIW2nP5h0IdSlsxg6vYqICOe3iSANXdq0XoWNXGqEg.gSqnctzbcyCKFwbGzMvO958A8HzjJLw10N9g57g78L8g.PNG/a_fc7fda6655654b68bc5602392b058b6e.png?type=l_webp", transaction: "73.1", brand: "Dior", nameEn: "Dior Saddle Flap Card Holder Blue Dior Oblique Jacquard", nameKo: "디올 새들 플랩 카드 홀더 블루 디올 오블리크 자카드", productPrice: "597,000", color: .systemGray6),
        ]
    }
}
