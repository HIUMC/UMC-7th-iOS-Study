//
//  ProductModel.swift
//  cloneKream
//
//  Created by 김서현 on 11/11/24.
//

import UIKit

struct OtherColorModel {
    let image: UIImage
}

extension OtherColorModel {
    static func dummy() -> [OtherColorModel] {
        return [
            OtherColorModel(image: .pd2),
            OtherColorModel(image: .pd3),
            OtherColorModel(image: .pd4),
            OtherColorModel(image: .pd5),
            OtherColorModel(image: .pd6),
            OtherColorModel(image: .pd7),
            OtherColorModel(image: .pd8)
        ]
    }
}

struct SizeModel {
    let size: String
    let price: Int
}

extension SizeModel {
    static func dummy() -> [SizeModel] {
        return [
            SizeModel(size: "S", price: 360000),
            SizeModel(size: "M", price: 360000),
            SizeModel(size: "L", price: 360000),
            SizeModel(size: "XL", price: 360000),
            SizeModel(size: "XXL", price: 360000)
        ]
    }
}
