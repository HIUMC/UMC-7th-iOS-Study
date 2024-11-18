//
//  AuthorizationInterceptor.swift
//  KreamClone
//
//  Created by 이현주 on 11/18/24.
//

import Foundation
import Alamofire

class AuthorizationInterceptor: RequestInterceptor {
    private var accessToken: String
    
    init(accessToken: String) {
        self.accessToken = accessToken
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        completion(.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry) // 재시도 로직을 설정할 경우 이 부분 수정
    }
}
