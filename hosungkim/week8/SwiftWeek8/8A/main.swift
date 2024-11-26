//
//  main.swift
//  8A
//
//  Created by 김호성 on 2024.11.20.
//

import Foundation

class Animal {
    func makeSound() {
        print("동물이 소리를 냅니다.")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("멍멍!")
    }
}

class Quokka: Animal {
    override func makeSound() {
        print("쿽쿽!")
    }
}

Animal().makeSound()
Dog().makeSound()
Quokka().makeSound()
