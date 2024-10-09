//
//  main.swift
//  2B
//
//  Created by 김호성 on 2024.10.08.
//

import Foundation

// 1. if문을 이용해 변수 temperature가 30 이상이면 "덥다"를 출력하고, 10 이상 30 미만이면 "적당하다"를 출력하며, 그렇지 않으면 "춥다"를 출력하세요. temperature 의 값은 임의로 지정해주세요.
var temperature: Int = 24

if temperature >= 30 {
    print("덥다")
} else if temperature < 30 && temperature >= 10 {
    print("적당하다")
} else {
    print("춥다")
}


// 2. switch문을 이용해 변수 day에 요일을 나타내는 정수(1부터 7까지, 1은 월요일)를 저장하고, 해당 요일에 따라 "주중" 또는 "주말"을 출력하세요. 예를 들어, 1부터 5까지는 "주중", 6과 7은 "주말"을 출력하세요. day 값은 임의로 지정해주세요.
var day: Int = 3

switch day {
case 1...5 :
    print("주중")
case 6, 7 :
    print("주말")
default :
    break
}
