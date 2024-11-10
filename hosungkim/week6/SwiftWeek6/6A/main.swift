//
//  main.swift
//  6A
//
//  Created by 김호성 on 2024.11.10.
//

import Foundation

class Rectangle {
    static var unit: String = "cm"
    
    var width: Int
    var height: Int
    
    var area: Int {
        get {
            return width * height
        }
    }
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
}

let rectangle = Rectangle(width: 5, height: 8)

// 1. "사각형의 너비: \(rectangle.width) cm, 높이: \(rectangle.height) cm"와 같이 출력되도록 작성해주세요!
print("사각형의 너비: \(rectangle.width) cm, 높이: \(rectangle.height) cm")

// 2. "사각형의 면적: \(rectangle.area) cm²"와 같이 출력되도록 작성해주세요!
print("사각형의 면적: \(rectangle.area) cm²")

// 3. "사각형의 면적: \(rectangle.area) \(Rectangle.unit)²" 형식으로 출력되도록 작성해주세요!
print("사각형의 면적: \(rectangle.area) \(Rectangle.unit)²")
