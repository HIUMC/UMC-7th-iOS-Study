//
//  ImageCardModel.swift
//  KREAM
//
//  Created by 주민영 on 11/4/24.
//

import Foundation
import UIKit

struct ImageCardModel {
    let image: UIImage
    let username: String
}

extension ImageCardModel {
    static func dummy() -> [ImageCardModel] {
        return [
            ImageCardModel(image: .imageCard1, username: "katarinabluu"),
            ImageCardModel(image: .imageCard2, username: "imwinter"),
            ImageCardModel(image: .imageCard3, username: "thousand_wooo")
        ]
    }
}
