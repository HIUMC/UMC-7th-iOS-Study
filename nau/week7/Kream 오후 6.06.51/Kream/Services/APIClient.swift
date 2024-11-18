//
//  APIClient.swift
//  Kream
//
//  Created by KoNangYeon on 11/15/24.
//

import Foundation
import Alamofire
import KakaoSDKUser
import KakaoSDKCommon
import KakaoSDKAuth

final class APIClient {
    static let shared = APIClient()
    private let session: Session

    private init() {
        let interceptor = AuthorizationInterceptor()
        session = Session(interceptor: interceptor)
    }

    func KakaoLogin(completion: @escaping (Result<OAuthToken, Error>) -> Void) {
        if UserApi.isKakaoTalkLoginAvailable() {//카카오톡 앱 있을 때
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let oauthToken = oauthToken {
                    completion(.success(oauthToken))
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let oauthToken = oauthToken {
                    completion(.success(oauthToken))
                }
            }
        }
    }

    func fetchKakaoUserProfile(completion: @escaping (Result<String, Error>) -> Void) {
        UserApi.shared.me { user, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = user { //카카오톡 계정의 닉네임 ...
                let nickname = user.kakaoAccount?.profile?.nickname ?? "닉네임 없음"
                completion(.success(nickname))
            }
        }
    }
}

