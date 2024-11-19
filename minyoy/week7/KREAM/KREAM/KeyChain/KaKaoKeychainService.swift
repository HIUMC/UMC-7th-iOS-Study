//
//  KaKaoKeyChainService.swift
//  KREAM
//
//  Created by 주민영 on 11/18/24.
//

import Foundation

class KaKaoKeychainService {
    
    static let shared = KaKaoKeychainService()
    
    private init() {}
    
    func loadNickname() -> String? {
        return loadToken(key: "nickname")
    }
    
    @discardableResult
    func saveToken(key: String, value: String) -> OSStatus {
        let data = value.data(using: .utf8)!
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data,
        ]
        
        // 기존 항목 삭제 후 새로운 항목 저장
        SecItemDelete(query as CFDictionary)
        return SecItemAdd(query as CFDictionary, nil)
    }
    
    
    func loadToken(key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,                 // 데이터를 반환하도록 설정
            kSecMatchLimit as String: kSecMatchLimitOne     // 하나의 결과만 반환
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == errSecSuccess else { return nil }
        
        if let data = item as? Data, let token = String(data: data, encoding: .utf8) {
            return token
        }
        
        return nil
    }
}
