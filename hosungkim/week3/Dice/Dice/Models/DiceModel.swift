//
//  DiceModel.swift
//  Dice
//
//  Created by 김호성 on 2024.10.13.
//

import Foundation

struct DiceModel {
    let diceImage: String
    let diceName: String
}

final class dummyDiceModel {
    static let diceDatas: [DiceModel] = [
        DiceModel(diceImage: "dice1.png", diceName: "주사위 1"),
        DiceModel(diceImage: "dice2.png", diceName: "주사위 2"),
        DiceModel(diceImage: "dice3.png", diceName: "주사위 3"),
        DiceModel(diceImage: "dice4.png", diceName: "주사위 4"),
        DiceModel(diceImage: "dice5.png", diceName: "주사위 5"),
        DiceModel(diceImage: "dice6.png", diceName: "주사위 6"),
    ]
}
