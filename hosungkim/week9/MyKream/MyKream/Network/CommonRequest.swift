//
//  CommonRepository.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.20.
//

import Foundation
import Moya
import CombineMoya
import Combine

class CommonRequest {
    static let shared = CommonRequest()
    private init() {
        
    }
    
    private let provider = MoyaProvider<CommonRestAPI>()
    
    func getProduct(search: String) -> AnyPublisher<SearchEntity, MoyaError> {
        return provider.requestPublisher(CommonRestAPI.getProduct(search: search))
            .map(SearchEntity.self)
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
