//
//  DetailModel.swift
//  KREAM
//
//  Created by 주민영 on 11/9/24.
//

import Foundation
import UIKit

struct DetailModel {
    let color: UIColor
}

extension DetailModel {
    static func dummy() -> [DetailModel] {
        return [
            DetailModel(color: .blue),
            DetailModel(color: .magenta),
            DetailModel(color: .green),
            DetailModel(color: .brown),
            DetailModel(color: .red),
            DetailModel(color: .brown),
            DetailModel(color: .blue),
        ]
    }
}
