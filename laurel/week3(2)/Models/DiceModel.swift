//
//  DiceModel.swift
//  week3(2)
//
//  Created by 어진 on 10/14/24.
//

import Foundation

struct DiceModel {
    let diceImage: String
    let diceName: String
}

final class dummyDiceModel {
    static let diceDatas: [DiceModel] = [
        DiceModel(diceImage: "Image 1.png", diceName: "주사위 1"),
        DiceModel(diceImage: "Image 2.png", diceName: "주사위 2"),
        DiceModel(diceImage: "Image 3.png", diceName: "주사위 3"),
        DiceModel(diceImage: "Image 4.png", diceName: "주사위 4"),
        DiceModel(diceImage: "Image 5.png", diceName: "주사위 5"),
        DiceModel(diceImage: "Image 6.png", diceName: "주사위 6")
    ]
}
