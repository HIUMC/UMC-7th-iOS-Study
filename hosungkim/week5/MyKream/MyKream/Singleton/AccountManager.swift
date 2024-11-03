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
    
    var loginModel: LoginModel?
}
