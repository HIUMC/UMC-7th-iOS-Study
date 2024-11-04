//
//  PhotoModel.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.03.
//

import Foundation
import UIKit

struct PhotoModel {
    let image: UIImage
    let title: String
}

extension PhotoModel {
    static func dummy() -> [PhotoModel] {
        return [
            PhotoModel(image: UIImage(named: "photo0.png")!, title: "@katarinabluu"),
            PhotoModel(image: UIImage(named: "photo1.png")!, title: "@imwinter"),
            PhotoModel(image: UIImage(named: "photo2.png")!, title: "@thousand_wooo"),
        ]
    }
}
