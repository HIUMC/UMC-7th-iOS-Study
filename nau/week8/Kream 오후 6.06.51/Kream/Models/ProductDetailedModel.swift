//
//  ProductDetailedModel.swift
//  Kream
//
//  Created by KoNangYeon on 11/9/24.
//

import Foundation
import UIKit

struct ProductDetailedModel {
    let image: UIImage
}

extension ProductDetailedModel {
    static func dummy() -> [ ProductDetailedModel] {
        return [
            ProductDetailedModel(image: .product1),
            ProductDetailedModel(image: .product2),
            ProductDetailedModel(image: .product3),
            ProductDetailedModel(image: .product4),
            ProductDetailedModel(image: .product5),
            ProductDetailedModel(image: .product6),
            ProductDetailedModel(image: .product1)
        ]
    }
    
}
