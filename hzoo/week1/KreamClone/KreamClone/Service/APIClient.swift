//
//  APIClient.swift
//  KreamClone
//
//  Created by 이현주 on 11/18/24.
//

import Foundation
import Alamofire

final class APIClient {
    static let shared = APIClient()
    
    private let session: Session
    
    private init() {
        let interceptor = AuthorizationInterceptor(accessToken: KeychainService.shared.loadToken(account: "", service: "kakaoAccess") ?? "")
        session = Session(interceptor: interceptor)
    }
    
    // 공통 네트워크 요청 메서드
    public func request<T: Codable>(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        session.request(url, method: method, parameters: parameters)
            .validate() // HTTP 상태 코드 검증
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
