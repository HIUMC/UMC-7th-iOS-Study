//
//  kakao.swift
//  Kream
//
//  Created by KoNangYeon on 11/16/24.
//

import Foundation
import KakaoSDKUser
import KakaoSDKCommon

func kakaoLogout() {
    UserApi.shared.logout {(error) in
        if let error = error {
            print(error)
        }
        else {
            print("logout() success.")
        }
    }
}

//연결끊기, 연동 삭제
func kakaoUnlink() {
    UserApi.shared.unlink {(error) in
        if let error = error {
            print(error)
        }
        else {
            print("unlink() success.")
        }
    }
}


