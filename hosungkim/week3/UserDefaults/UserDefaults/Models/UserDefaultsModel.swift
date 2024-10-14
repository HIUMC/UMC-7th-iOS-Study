//
//  UserDefaultsModel.swift
//  UserDefaults
//
//  Created by 김호성 on 2024.10.13.
//

import Foundation

class UserDefaultsModel {
    private let userDefaults: UserDefaults = UserDefaults.standard
    private let userTextKey: String = "userText"
    
    public func saveUserText(_ text: String) {
        userDefaults.set(text, forKey: userTextKey)
    }
    
    public func loadUserText() -> String? {
        return userDefaults.string(forKey: userTextKey)
    }
    
}
