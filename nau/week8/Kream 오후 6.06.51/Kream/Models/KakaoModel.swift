//
//  KakaoModel.swift
//  Kream
//
//  Created by KoNangYeon on 11/16/24.
//

import Foundation

struct KakaoModel : Codable {
    let userInformation : [UserInformation]
}

struct UserInformation : Codable {
    let nicname : String
}
