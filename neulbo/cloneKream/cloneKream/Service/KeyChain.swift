//
//  KeyChain.swift
//  cloneKream
//
//  Created by 김서현 on 11/18/24.
//

import Foundation
import Security

class KeychainService {
    
    static let shared = KeychainService()
    
    private init() {}
    

    func saveNicknameToKeychain(nickname: String) -> Bool {
        let key = "nickname" // 키 값
        let data = nickname.data(using: .utf8)! // 저장할 데이터

        // 기존 데이터가 있다면 삭제
        SecItemDelete([kSecClass as String: kSecClassGenericPassword,
                       kSecAttrAccount as String: key] as CFDictionary)

        // Keychain에 데이터 추가
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]

        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }

    
    
    @discardableResult
    func saveToken(token: String, name: String, service: String) -> OSStatus {
        let tokenData = token.data(using: .utf8)!
        
        // Access Control 설정 (Face ID 또는 기기 잠금 해제 후 접근 가능)
        let accessControl = SecAccessControlCreateWithFlags(
            kCFAllocatorDefault,
            kSecAttrAccessibleWhenUnlocked,
            .userPresence,   // 사용자 인증 (Face ID, Touch ID 또는 기기 암호)
            nil
        )
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,  // 일반 데이터 저장
            kSecAttrAccount as String: name,             // 계정 이름
            kSecAttrService as String: service,             // 서비스 이름
            kSecValueData as String: tokenData,             // 실제 토큰 데이터
            kSecAttrAccessControl as String: accessControl! // 접근 제어 추가
        ]
        
        // 기존 항목 삭제 후 새로운 항목 저장
        SecItemDelete(query as CFDictionary)
        return SecItemAdd(query as CFDictionary, nil)
    }
    
    
    
    
    func loadToken(name: String, service: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: name,
            kSecAttrService as String: service,
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
    
    func getNicknameFromKeychain() -> String? {
        let key = "nickname" // 키 값

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        if status == errSecSuccess, let data = result as? Data {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    
    // 토큰 삭제 함수
    @discardableResult
    func deleteToken(name: String, service: String) -> OSStatus {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: name,
            kSecAttrService as String: service
        ]
        
        return SecItemDelete(query as CFDictionary)
    }
    
    
    func deleteNicknameFromKeychain() -> Bool {
        let key = "nickname" // 키 값

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]

        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess
    }
}
