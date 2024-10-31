//
//  HOMEModel.swift
//  Kream
//
//  Created by KoNangYeon on 10/31/24.
//

import Foundation
import UIKit

struct HOMEModel {
    let image: UIImage
    let name: String
}

extension HOMEModel {
    static func dummy() -> [HOMEModel]{
        return [
            HOMEModel(image: .home1, name: "크림 드로우"),
            HOMEModel(image: .home2, name: "실시간 차트"),
            HOMEModel(image: .home3, name: "남성 추천"),
            HOMEModel(image: .home4, name: "여성 추천"),
            HOMEModel(image: .home5, name: "색다른 추천"),
            HOMEModel(image: .home6, name: "정가 아래"),
            HOMEModel(image: .home7, name: "윤세 24AW"),
            HOMEModel(image: .home8, name: "올해의 베스트"),
            HOMEModel(image: .home9, name: "10월 베네핏"),
            HOMEModel(image: .home10, name: "아크네 선물"),
        ]
    }
}
