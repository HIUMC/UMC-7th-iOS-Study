//
//  LoginModel.swift
//  KreamClone
//
//  Created by 이현주 on 10/2/24.
//

import Foundation

class LoginModel {
    private let userDefaults = UserDefaults.standard
    
    private let emailTextKey: String = "id"
    private let pwdTextKey: String = "pw"
    
    /// 유저가 입력한 email,pw 값을 UserDefaults에 저장합니다.
    /// - Parameter text: 유저가 입력한 텍스트 값
    public func saveEmailText(_ text: String) {
        userDefaults.set(text, forKey: emailTextKey)
    }
    
    public func savePwText(_ text: String) {
        userDefaults.set(text, forKey: pwdTextKey)
    }
    
    /// UserDefaults에 저장된 값을 불러옵니다.
    /// - Returns: 저장된 값 String으로 return
    public func loadEmailText() -> String? {
        return userDefaults.string(forKey: emailTextKey)
    }
    
    public func loadPwText() -> String? {
        return userDefaults.string(forKey: pwdTextKey)
    }
}

