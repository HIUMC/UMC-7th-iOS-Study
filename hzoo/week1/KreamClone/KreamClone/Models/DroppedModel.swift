//
//  DroppedModel.swift
//  KreamClone
//
//  Created by 이현주 on 11/4/24.
//

import UIKit

struct DroppedModel {
    let trade: String
    let image: UIImage
    let brand: String
    let name: String
    let price: String
}

extension DroppedModel {
    static func list() ->  [DroppedModel] {
        return [
            DroppedModel(trade: "12.8만", image: .mlb, brand: "MLB", name: "청키라이너 뉴욕양키스", price: "139,000"),
            DroppedModel(trade: "15.6만", image: .jordan, brand: "Jordan", name: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000"),
            DroppedModel(trade: "7.8만", image: .humanmade, brand: "Human Made", name: "Human Made x Kaws Varsity Jacket #1 Black", price: "556,000"),
            DroppedModel(trade: "15.6만", image: .jordan, brand: "Jordan", name: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000"),
            DroppedModel(trade: "12.8만", image: .mlb, brand: "MLB", name: "청키라이너 뉴욕양키스", price: "139,000")
        ]
    }
}
