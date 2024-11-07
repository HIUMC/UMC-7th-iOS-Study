//
//  LoginModel.swift
//  KREAM
//
//  Created by 이태림 on 10/3/24.
//

import Foundation

struct LoginModel {
    var id: String
    var pwd: String
    
    var isValid: Bool {
        return isValidid() && isValidpwd()
    }
    
    func isValidid() -> Bool {
        let idRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9._]+\\.[A-Za-z]{2,64}"
        let idTest = NSPredicate(format: "SELF MATCHES %@", idRegEx)
        return idTest.evaluate(with: id)
    }
    
    func isValidpwd() -> Bool {
            return pwd.count >= 8
        }
}
