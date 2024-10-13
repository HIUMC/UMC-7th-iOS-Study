//
//  main.swift
//  3A
//
//  Created by 김호성 on 2024.10.13.
//

import Foundation

var score: [String: Int] = [
    "Alice": 50,
    "Bob": 60,
    "Min": 90,
]

score["Alice"] = 95
score.removeValue(forKey: "Bob")

for (name, score) in score {
    print("\(name): \(score)")
}
