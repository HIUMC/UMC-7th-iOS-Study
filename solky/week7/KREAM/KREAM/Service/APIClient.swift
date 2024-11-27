import Foundation
import Alamofire


final class APIClient {
    static let shared = APIClient()
    
    private let session: Session

    private init() {
        if let token = KeychainService.shared.loadToken(key: "accessToken") {
                let interceptor = AuthorizationInterceptor(accessToken: token)
                session = Session(interceptor: interceptor)
            } else {
                session = Session()
            }
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