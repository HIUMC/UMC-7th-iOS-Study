//
//  main.swift
//  4A
//
//  Created by 김호성 on 2024.10.29.
//

import Foundation

// 1. "최종 결제 금액: (최종 결제 금액)원"과 같이 출력되도록 작성해주세요!
func calculateTotalPrice(order: Int, tip: Int) -> Int {
    return order + tip
}

print("최종 결제 금액: \(calculateTotalPrice(order: 10000, tip: 2000))원")

// 2. "덥다", "춥다", "적당하다"와 같이 출력되도록 작성해주세요!
func checkTemperature(temperature: Int) {
    if temperature > 30 {
        print("덥다")
    } else if temperature > 20 {
        print("적당하다")
    } else {
        print("춥다")
    }
}

checkTemperature(temperature: 25)

// 3. "(여행지)에서의 총 여행 예산은 (총 예산)원입니다."와 같이 출력되도록 작성해주세요!
func printTravelBudget(city: String, day: Int, dailyBudget: Int) {
    print("\(city)에서의 총 여행 예산은 \(day * dailyBudget)원입니다.")
}

printTravelBudget(city: "서울", day: 5, dailyBudget: 80000)

// 4. "오늘 날짜: 2024-09-19"와 같이 오늘 날짜가 "YYYY-MM-DD" 형식으로 출력되도록 작성해주세요!
func getCurrentDate() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: Date())
}
print("오늘 날짜: \(getCurrentDate())")
