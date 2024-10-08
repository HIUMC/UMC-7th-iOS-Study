//
//  main.swift
//  2A
//
//  Created by 김호성 on 2024.10.08.
//

import Foundation

// 1. 단항 연산자: 변수 x의 값을 5로 초기화한 후 1 증가시키고, 증가된 값을 출력
var x: Int = 5

x += 1

print(x)


// 2. 이항 연산자: 변수 a와 b를 각각 10과 20으로 초기화한 뒤 더한 결과를 변수 sum에 저장하고, 그 결과를 출력
var a: Int = 10
var b: Int = 20

var sum: Int = a + b

print(sum)


// 3. 삼항 연산자: 변수 score가 60 이상이면 "합격", 그렇지 않으면 "불합격"을 출력
var score: Int = 60

print(score >= 60 ? "합격" : "불합격")


// 4. 논리 연산자: 변수 isMember가 true이고 points가 100 이상이면 "할인 가능", 그렇지 않으면 "할인 불가능"을 출력
var isMember: Bool = true
var points: Int = 100

print(isMember && points >= 100 ? "할인 가능" : "할인 불가능")


// 5. 범위 연산자: 변수 numbers에 1부터 5까지의 숫자를 저장하고, 이 숫자들을 출력
var numbers = 1...5

for (index, number) in numbers.enumerated() {
    if index == numbers.count-1 {
        print(number)
    } else {
        print(number, terminator: ", ")
    }
}
