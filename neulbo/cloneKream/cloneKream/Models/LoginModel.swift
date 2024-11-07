//
//  LoginModel.swift
//  cloneKream
//
//  Created by 김서현 on 10/2/24.
//

import Foundation


class LoginModel {
    static let shared = LoginModel()
    
    private let userDefaults = UserDefaults.standard
    var userId: String = "userText"
    
    private init() {}
    
    public func saveUserInfo(_ pwd: String) {
        userDefaults.set(pwd, forKey: userId)
    }
    
    public func loadUserInfo() -> String? {
        return userDefaults.string(forKey: userId)
    }
    
}
