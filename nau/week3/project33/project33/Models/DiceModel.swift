//
//  DiceModel.swift
//  project33
//
//  Created by KoNangYeon on 10/13/24.
//

import Foundation

struct DiceModel {
    let diceImage: String
    let diceName: String
}

final class dummyDiceModel {
    static let diceDatas: [DiceModel] = [
        DiceModel(diceImage: "dice1", diceName: "주사위 1"),
        DiceModel(diceImage: "dice2", diceName: "주사위 2"),
        DiceModel(diceImage: "dice3", diceName: "주사위 3"),
        DiceModel(diceImage: "dice4", diceName: "주사위 4"),
        DiceModel(diceImage: "dice5", diceName: "주사위 5"),
        DiceModel(diceImage: "dice6", diceName: "주사위 6")
    ]
}
