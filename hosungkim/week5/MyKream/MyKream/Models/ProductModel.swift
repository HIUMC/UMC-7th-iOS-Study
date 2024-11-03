//
//  ProductModel.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.03.
//

import Foundation
import UIKit

struct ProductModel {
    let image: UIImage
    let trading: String
    let title: String
    let subtitle: String
    let price: String
    var bookmark: Bool
}

extension ProductModel {
    static func dummy() -> [ProductModel] {
        return [
            ProductModel(image: UIImage(named: "pd0.png")!, trading: "12.8만", title: "MLB", subtitle: "청키라이너 뉴욕양키스", price: "139,000원", bookmark: false),
            ProductModel(image: UIImage(named: "pd1.png")!, trading: "15.6만", title: "Jordan", subtitle: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000원", bookmark: true),
            ProductModel(image: UIImage(named: "pd2.png")!, trading: "12.8만", title: "Human Made", subtitle: "Human Made x Kaws Varsity Jacket #1 Black", price: "2,000,000원", bookmark: false),
        ]
    }
}
