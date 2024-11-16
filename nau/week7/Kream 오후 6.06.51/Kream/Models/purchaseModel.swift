//
//  purchaseDetailedModel.swift
//  Kream
//
//  Created by KoNangYeon on 11/14/24.
//

import Foundation

struct purchaseModel {
    let size : String
    let price : String
}

extension purchaseModel {
    static func dummy() -> [purchaseModel] {
        return [
            purchaseModel(size: "S", price: "360,000"),
            purchaseModel(size: "M", price: "360,000"),
            purchaseModel(size: "L", price: "360,000"),
            purchaseModel(size: "XL", price: "360,000"),
            purchaseModel(size: "XXL", price: "360,000")
        ]
    }
}
