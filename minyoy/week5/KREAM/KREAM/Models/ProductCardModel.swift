//
//  ProductCardModel.swift
//  KREAM
//
//  Created by 주민영 on 11/4/24.
//

import Foundation
import UIKit

struct ProductCardModel {
    let productImage: UIImage
    let transaction: String
    let brand: String
    let productTitle: String
    let productPrice: String
    let color: UIColor
}

extension ProductCardModel {
    static func dummy() -> [ProductCardModel] {
        return [
            ProductCardModel(productImage: .collectionImage5, transaction: "12.8", brand: "MLB", productTitle: "청키라이너 뉴욕양키스", productPrice: "139,000", color: UIColor(red: 234/255, green: 240/255, blue: 245/255, alpha: 1)),
            ProductCardModel(productImage: .collectionImage3, transaction: "15.6", brand: "Jordan", productTitle: "Jordan 1 Retro High OG Yellow Ochre", productPrice: "228,000", color: UIColor(red: 246/255, green: 237/255, blue: 236/255, alpha: 1)),
            ProductCardModel(productImage: .collectionImage4, transaction: "12.8", brand: "Human Made", productTitle: "Human Made x Kaws Varsity Jacket #1 Black", productPrice: "2,000,000", color: .systemGray6)
        ]
    }
}
