/* 프로토콜 구현 */
protocol Summable {
    var value: Int { get }
}

extension Summable {
    func sum(with other: Self) -> Int {
        return value + other.value
    }
}

struct Number: Summable {
    var value: Int
}

let number1 = Number(value: 3)
let number2 = Number(value: 5)

print(number1.sum(with: number2)) // 출력 : 8
