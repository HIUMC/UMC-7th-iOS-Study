//
//  CountUpDownModel.swift
//  UMC-iOS-Workbook1실습
//
//  Created by KoNangYeon on 9/29/24.
//

import Foundation

struct CountUpDownModel {
    var count : Int = 0
    
    mutating func increaseCount() {
        self.count += 1
    }
    
    mutating func decreaseCount() {
        self.count -= 1
    }
}


