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
}

