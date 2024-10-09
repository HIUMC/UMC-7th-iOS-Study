//
//  main.swift
//  2C
//
//  Created by 김호성 on 2024.10.08.
//

import Foundation

// 1. for-in문: 배열 fruits에 "Apple", "Banana", "Cherry"를 저장하고, 각 과일의 이름을 출력
var fruits: [String] = ["Apple", "Banana", "Cherry"]
for fruit in fruits {
    print(fruit)
}

// 2. while문: 변수 count가 5가 될 때까지 "Count: n" 형식으로 숫자를 출력
var count: Int = 0
while count <= 5 {
    print("Count: \(count)")
    count += 1
}
