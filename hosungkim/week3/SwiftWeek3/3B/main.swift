//
//  main.swift
//  3B
//
//  Created by 김호성 on 2024.10.13.
//

import Foundation

var fruits: Set<String> = ["Appe", "Banana", "Orange"]

if fruits.contains("Banana") {
    fruits.insert("Mango")
}

for fruit in fruits {
    print(fruit)
}
