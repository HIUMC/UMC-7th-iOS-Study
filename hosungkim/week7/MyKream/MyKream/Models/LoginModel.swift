//
//  LoginModel.swift
//  MyKream
//
//  Created by 김호성 on 2024.09.25.
//

import Foundation
import UIKit

struct LoginModel {
    var id: String
    var password: String
    var profile: UIImage?
    
    init() {
        self.id = UserDefaults.standard.string(forKey: "id") ?? ""
        self.password = UserDefaults.standard.string(forKey: "password") ?? ""
    }
    
    init(id: String, password: String) {
        self.id = id
        self.password = password
    }
    
    mutating func updateID(_ id: String) {
        self.id = id
        saveToUserDefaults()
    }
    mutating func updatePassword(_ password: String) {
        self.password = password
        saveToUserDefaults()
    }
    
    func saveToUserDefaults() {
        UserDefaults.standard.set(id, forKey: "id")
        UserDefaults.standard.set(password, forKey: "password")
    }
    
    mutating func loadFromUserDefaults() {
        self.id = UserDefaults.standard.string(forKey: "id") ?? ""
        self.password = UserDefaults.standard.string(forKey: "password") ?? ""
    }
    
    mutating func update(id: String, profile: UIImage?) {
        self.id = id
        self.profile = profile
    }
}

