//
//  ProductService.swift
//  Kream
//
//  Created by 어진 on 11/25/24.
//

import Foundation
import Moya

final class ProductService {
    static let shared = ProductService()
    private let provider = MoyaProvider<ProductAPI>()

    func searchProducts(query: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        provider.request(.searchProducts(query: query)) { result in
            switch result {
            case .success(let response):
                do {
                    let data = try JSONDecoder().decode(ProductsResponse.self, from: response.data)
                    completion(.success(data.products))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
