//
//  KaKaoUserInfo.swift
//  KREAM
//
//  Created by 주민영 on 11/18/24.
//

import Foundation

struct KaKaoUserInfo: Codable {
    struct KakaoUserAccount: Codable {
        var nickname: String?
    }
    var connected_at: String?
    var id: Int?
    var properties: KakaoUserAccount?
}
