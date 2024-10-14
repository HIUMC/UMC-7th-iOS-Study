//
//  LoginModel.swift
//  KREAM
//
//  Created by 주민영 on 10/1/24.
//

import Foundation

struct LoginModel {
    private let userDefaults = UserDefaults.standard
    private let userId: String = "userId"
    private let userPwd: String = "userPwd"
    
    public func saveUserId(_ id: String) {
        userDefaults.set(id, forKey: userId)
    }
    public func saveUserPwd(_ pwd: String) {
        userDefaults.set(pwd, forKey: userPwd)
    }
    
    public func loadUserId() -> String? {
        return userDefaults.string(forKey: userId)
    }
    
    public func loadUserPwd() -> String? {
        return userDefaults.string(forKey: userPwd)
    }
}
