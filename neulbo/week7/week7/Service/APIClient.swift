//
//  APIClient.swift
//  week7
//
//  Created by 김서현 on 11/17/24.
//

import Foundation
import Alamofire

final class APIClient {
    static let shared = APIClient() //싱글톤
    
    private let session: Session
    private let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    
    private init() {
        guard let apiKey = apiKey else {
            fatalError("API key is missing!")
        }
        let interceptor = AuthorizationInterceptor(kakaoKey: apiKey) // 자동으로
        session = Session(interceptor: interceptor)
    }
    
    public func request<T: Codable>(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        completion: @escaping (Result<T, Error>) -> Void) {
            session.request(url, method: method, parameters: parameters)
                .validate()
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
