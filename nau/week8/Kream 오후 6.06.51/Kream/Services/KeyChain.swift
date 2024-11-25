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
    func save(_ data: Data, key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
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
    
    //private var nicknameCache : String?
    private var cache: [String: String ] = [:] //닉네임과 이미지URL 캐싱 분리
        
        func loadValue(key: String) -> String? {
            //캐싱 적용
            if let cachedValue = cache[key] {
                return cachedValue
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
                cache[key] = value
                return value
            } else {
                print("Failed to retrieve value for key \(key): \(status)")
                return nil
            }
        }
}



   

