//
//  ChallengeModel.swift
//  KreamClone
//
//  Created by 이현주 on 11/4/24.
//

import UIKit

struct ChallengeModel {
    let image: UIImage
    let id: String
}

extension ChallengeModel {
    static func list() ->  [ChallengeModel] {
        return [
            ChallengeModel(image: .karina, id: "katarinabluu"),
            ChallengeModel(image: .winter, id: "imwinter"),
            ChallengeModel(image: .thousand, id: "thousand_wooo"),
            ChallengeModel(image: .winter, id: "imwinter"),
            ChallengeModel(image: .karina, id: "katarinabluu")
        ]
    }
}
