
// 1. "사각형의 너비: \(rectangle.width) cm, 높이: \(rectangle.height) cm"와 같이 출력되도록 작성해주세요!
/*
class Rectangle {
    var width = 10
    var height = 20
}

let rectangle = Rectangle()
print("사각형의 너비: \(rectangle.width) cm, 높이: \(rectangle.height) cm")
*/

// 2. "사각형의 면적: \(rectangle.area) cm²"와 같이 출력되도록 작성해주세요!
/*
class Rectangle {
    var width = 10
    var height = 20
    
    var area: Int {
        get {
            return width * height
        }
    }
}

let rectangle = Rectangle()
print("사각형의 면적: \(rectangle.area) cm²")
*/

// 3. "사각형의 면적: \(rectangle.area) \(Rectangle.unit)²" 형식으로 출력되도록 작성해주세요!

class Rectangle {
    static let unit: String = "cm"
    
    var width = 10
    var height = 20
    
    var area: Int {
        get {
            return width * height
        }
    }
}

let rectangle = Rectangle()
print("사각형의 면적: \(rectangle.area) \(Rectangle.unit)²")
