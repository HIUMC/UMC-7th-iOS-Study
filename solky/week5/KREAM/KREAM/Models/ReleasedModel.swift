//
//  ReleasedModel.swift
//  KREAM
//
//  Created by 이태림 on 11/4/24.
//

import UIKit

struct ReleasedModel {
    let image: String
    let volumename: String
    let savedimage: String
    let brandname: String
    let productname: String
    let pricename: String
    let rightbuyname: String
}

extension ReleasedModel {
    static func dummy2() -> [ReleasedModel] {
        return [
            ReleasedModel(image: "shoes.png", volumename: "거래 12.8만", savedimage: "_icon_saved_none.png", brandname: "MLB", productname: "청키라이너 뉴욕양키스", pricename: "139,000원", rightbuyname: "즉시 구매가"),
            ReleasedModel(image: "yellowshoes.png", volumename: "거래 15.6만", savedimage: "_icon_saved_filled.png", brandname: "Jordan", productname: "Jordan 1 Retro High OG Yellow Ochre", pricename: "228,000원", rightbuyname: "즉시 구매가"),
            ReleasedModel(image: "jumper.png", volumename: "거래 12.8만", savedimage: "_icon_saved_none.png", brandname: "Human Made", productname: "Human Made x Kaws Varsity Jacket #1 Black", pricename: "2,000,000원", rightbuyname: "즉시 구매가")
        ]
    }
}
