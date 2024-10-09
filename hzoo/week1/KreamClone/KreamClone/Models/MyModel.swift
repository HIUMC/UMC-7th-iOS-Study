//
//  MyModel.swift
//  KreamClone
//
//  Created by 이현주 on 10/7/24.
//

import Foundation

struct MyModel {
    var nickname: String = ""
    var followers: Int = 0
    var followings: Int = 0
    
    init(nickname: String, followers: Int, followings: Int) {
        self.nickname = nickname
        self.followers = followers
        self.followings = followings
    }
}

