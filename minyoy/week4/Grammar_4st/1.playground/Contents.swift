import Foundation

/* 1-1

func calculateTotalPrice(total: Int, tip: Int) -> Int {
    let totalPrice = total + tip
    return totalPrice
}

print("최종 결제 금액: \(calculateTotalPrice(total: 10000, tip: 1000))원")
*/

/* 1-2
 
func checkTemperature(temperature: Int) {
    if (temperature > 30) {
        print("덥다")
    } else if (temperature > 10){
        print("적당하다")
    } else {
        print("춥다")
    }
}

checkTemperature(temperature: 20)
*/

/* 1-3
 
func printTravelBudget(city: String, day: Int, budget: Int) {
    let total = day * budget
    print("\(city)에서의 총 여행 예산은 \(total)원입니다.")
}

printTravelBudget(city: "프랑스", day: 20, budget: 300000)
*/

/* 1-4

func getCurrentDate () -> String {
    let today = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: Date())
}

print("오늘 날짜: \(getCurrentDate())")
*/
