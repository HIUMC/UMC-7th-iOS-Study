//
//  CountUpDownModel.swift
//  CountUpDown
//
//  Created by 주민영 on 10/1/24.
//

import Foundation

struct CountUpDownModel {
    var count: Int = 0
    
    // count 변수를 1 증가시킵니다.
    mutating func increaseCount() {
        self.count += 1
    }
    
    // count 변수를 1 감소시킵니다.
    mutating func decreaseCount() {
        self.count -= 1
    }
}
