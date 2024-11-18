//
//  AuthorizationInterceptor.swift
//  Kream
//
//  Created by KoNangYeon on 11/18/24.
//

import Foundation
import Alamofire
import KakaoSDKCommon
import KakaoSDKAuth

final class AuthorizationInterceptor: RequestInterceptor {
    private var AccessToken: String? {
        return TokenManager.manager.getToken()!.accessToken
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        var request = urlRequest
        if let token = AccessToken {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        completion(.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: any Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }
    
}
