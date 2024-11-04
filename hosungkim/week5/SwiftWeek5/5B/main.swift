//
//  main.swift
//  5B
//
//  Created by 김호성 on 2024.11.03.
//

import Foundation

struct Car {
    let make: String
    let model: String
    let year: Int
    var mileage: Double
    var isRunning: Bool
    
    init(make: String, model: String, year: Int, mileage: Double, isRunning: Bool) {
        self.make = make
        self.model = model
        self.year = year
        self.mileage = mileage
        self.isRunning = isRunning
    }
    
    mutating func start() {
        if isRunning {
            print("차 이미 시동 중.")
            return
        }
        isRunning = true
        print("차 시동 걸림.")
    }
    mutating func stop() {
        if !isRunning {
            print("차 이미 꺼짐.")
            return
        }
        isRunning = false
        print("차 시동 꺼짐.")
    }
    mutating func drive(distance: Double) {
        if !isRunning {
            print("이동 불가능. 차 시동 꺼짐.")
            return
        }
        self.mileage += distance
        print("이동거리 \(distance) km. 현재 mileage: \(self.mileage) km.")
    }
}

var myCar = Car(make: "한국", model: "KIA", year: 2024, mileage: 15000.0, isRunning: false)

myCar.start() // 출력: "차 시동 걸림."
myCar.drive(distance: 100) // 출력: "이동거리 100 km. 현재 mileage: 15100 km"
myCar.stop() // 출력: "차 시동 꺼짐."
myCar.drive(distance: 50) // 출력: "이동 불가능. 차 시동 꺼짐."
myCar.start() // 출력: "Car started."
myCar.start() // 출력: "차 이미 시동 중."
