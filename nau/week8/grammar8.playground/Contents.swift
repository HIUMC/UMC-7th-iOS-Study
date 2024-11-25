import UIKit

class Animal {
    func makeSound() {
        print("동물이 소리를 냅니다.")
    }
}

class Dog : Animal {
    override func makeSound() {
        print("멍멍!")
    }
}

class Quokka : Animal {
    override func makeSound() {
        print("쿽쿽!")
    }
}

