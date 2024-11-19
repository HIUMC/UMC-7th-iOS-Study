//
//  Untitled.swift
//  KREAM
//
//  Created by 이태림 on 11/4/24.
//

import UIKit

struct MustItemModel {
    let image: String
    let name: String
}

extension MustItemModel {
    static func mustitemdummy() -> [MustItemModel] {
        return [
            MustItemModel(image: "karina.png", name: "@katarinabluu"),
            MustItemModel(image: "winter.png", name: "@imwinter"),
            MustItemModel(image: "thousand.png", name: "@thousand_wooo")
        ]
    }
}
