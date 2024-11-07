//
//  CountUpDownModel.swift
//  countUpDown
//
//  Created by 어진 on 10/3/24.
//

import Foundation

struct CountUpDownModel {
    var count: Int = 0
    
    mutating func increaseCount() {
        self.count += 1
    }
    
    mutating func decreaseCount() {
        self.count -= 1
    }
}
