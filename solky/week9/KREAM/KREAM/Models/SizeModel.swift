//
//  SizeModel.swift
//  KREAM
//
//  Created by 이태림 on 11/11/24.
//

import UIKit

struct SizeModel {
    let size: String
    let price: String
}

extension SizeModel {
    static func sizedummy() -> [SizeModel] {
        return [
            SizeModel(size: "S", price: "360,000"),
            SizeModel(size: "M", price: "360,000"),
            SizeModel(size: "L", price: "360,000"),
            SizeModel(size: "XL", price: "360,000"),
            SizeModel(size: "XXL", price: "360,000"),
        ]
    }
}
