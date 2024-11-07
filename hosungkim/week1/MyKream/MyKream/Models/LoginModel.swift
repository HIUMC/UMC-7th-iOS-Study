//
//  LoginModel.swift
//  MyKream
//
//  Created by 김호성 on 2024.09.25.
//

import Foundation

struct LoginModel {
    var id: String
    var password: String
    
    init(id: String?, password: String?) {
        self.id = id ?? ""
        self.password = password ?? ""
    }
}

