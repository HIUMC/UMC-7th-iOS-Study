//
//  LoginModel.swift
//  Kream
//
//  Created by KoNangYeon on 9/30/24.
//

import Foundation

struct LoginModel{
    
    private let userId: String = "Id"
    private let userPwd: String = "Pwd"
    
    let defaults = UserDefaults.standard

    public func savedId(_ id: String) {
        defaults.set(id, forKey: userId)
    }
    
    public func savedPwd(_ pwd: String) {
        defaults.set(pwd, forKey: userPwd)
    }
    
    public func loadId() -> String? {
        return defaults.string(forKey: userId)
    }

    public func loadPwd() -> String? {
        return defaults.string(forKey: userPwd)
    }
    
}


