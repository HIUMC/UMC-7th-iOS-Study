//
//  KakaoMemberInfoEntity.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.14.
//


struct KakaoMemberInfoEntity: Codable {
    struct KakaoAccountEntity: Codable {
        var nickname: String?
        var profile_image: String?
        var thumbnail_image: String?
    }
    var id: Int?
    var connected_at: String?
    var properties: KakaoAccountEntity?
}
