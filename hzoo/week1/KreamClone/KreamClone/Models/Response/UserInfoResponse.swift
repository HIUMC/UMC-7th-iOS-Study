//
//  UserInfoResponse.swift
//  KreamClone
//
//  Created by 이현주 on 11/18/24.
//

struct UserInfoResponse: Codable {
    struct KakaoProperties: Codable {
        let nickname: String?
    }
    let properties: KakaoProperties?
}
