//
//  AccountManager.swift
//  MyKream
//
//  Created by 김호성 on 2024.10.07.
//

import Foundation

class AccountManager {
    public static let shared = AccountManager()
    
    private init() {
        
    }
    var accessToken: String {
        get {
            return KeyChainManager.shared.loadToken(account: "", service: "com.mykream.accessToken")!
        }
        set(newValue) {
            KeyChainManager.shared.saveToken(token: newValue, account: "", service: "com.mykream.accessToken")
        }
    }
    var refreshToken: String {
        get {
            return KeyChainManager.shared.loadToken(account: "", service: "com.mykream.refreshToken")!
        }
        set(newValue) {
            KeyChainManager.shared.saveToken(token: newValue, account: "", service: "com.mykream.refreshToken")
        }
    }
    var loginModel: LoginModel?
}
