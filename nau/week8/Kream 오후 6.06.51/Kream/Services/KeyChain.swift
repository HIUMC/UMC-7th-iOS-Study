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
    
    private var nicknameCache: String?
    
    func loadNickname(key: String) -> String? {
        //캐싱 적용
        if let cachedNickname = nicknameCache {
            return cachedNickname
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecSuccess, let data = result as? Data,
           let value = String(data: data, encoding: .utf8) {
            nicknameCache = value
            return value
        } else {
            print("Failed to retrieve value for key \(key): \(status)")
            return nil
        }
    }
}



   

