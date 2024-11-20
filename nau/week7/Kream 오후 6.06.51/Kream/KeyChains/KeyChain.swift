//
//  KeyChain.swift
//  Kream
//
//  Created by KoNangYeon on 11/16/24.
//

import Foundation
import Security

final class KeychainHelper {
    static let shared = KeychainHelper()

    private init() {}

    // 데이터 저장
    func save(_ data: Data, service: String, account: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecValueData as String: data
        ]

        // 기존 값 삭제
        SecItemDelete(query as CFDictionary)

        // 새 값 추가
        SecItemAdd(query as CFDictionary, nil)
    }

    // 데이터 가져오기
    func read(service: String, account: String) -> Data? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecReturnData as String: true
        ]

        var result: AnyObject?
        SecItemCopyMatching(query as CFDictionary, &result)
        return result as? Data
    }

    // 데이터 삭제
    func delete(service: String, account: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account
        ]
        SecItemDelete(query as CFDictionary)
    }
}

//토큰과 닉네임 저장
func saveToken(_ token: String){
    let service = "kakaoLoginData"
    
    if let tokenData = token.data(using: .utf8) {
        KeychainHelper.shared.save(tokenData, service: service, account: "accessToken")
    }
}
