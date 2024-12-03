/* 프로토콜 구현 부분 */
protocol TestB {}

/* 익스텐션 구현 부분 */
extension TestB {
    func methodA() -> String {
        return "안녕하세요!! 문법 문제입니다!!"
    }
}

struct Item: TestB {}

let item = Item()
print(item.methodA()) // 출력 : 안녕하세요!! 문법 문제입니다!!
