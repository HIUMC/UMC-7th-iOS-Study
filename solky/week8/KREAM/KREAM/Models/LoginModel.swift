//
//  LoginModel.swift
//  KREAM
//
//  Created by 이태림 on 10/3/24.
//

import Foundation

class LoginModel {
    private let userDefaults = UserDefaults.standard
    private let userEmailKey: String = "userEmail"
    private let userPasswordKey: String = "userPassword"
    
    private let keychain = KeychainService.shared
    
    // 이메일, 비밀번호 저장
    public func saveUserEmail(_ email: String) {
        userDefaults.set(email, forKey: userEmailKey)
    }
    
    public func saveUserPassword(_ password: String) {
        userDefaults.set(password, forKey: userPasswordKey)
    }
    
    // 저장된 값 불러오기
    public func loadUserEmail() -> String? {
        return userDefaults.string(forKey: userEmailKey)
    }
    
    public func loadUserPassword() -> String? {
        return userDefaults.string(forKey: userPasswordKey)
    }
}

struct UserModel: Codable {
    struct KakaoUserAccount: Codable {
        var nickname: String?
    }
    var properties: KakaoUserAccount?
}
