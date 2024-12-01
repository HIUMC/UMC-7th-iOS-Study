//
//  ViewController.swift
//  Kream
//
//  Created by KoNangYeon on 9/30/24.
//

import UIKit
import Then
import KakaoSDKUser
import KakaoSDKAuth

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = LoginView1
        
        LoginView1.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        LoginView1.loginKakaoButton.addTarget(self, action: #selector(kakaoBtndidTap), for: .touchUpInside)
        LoginView1.loginAppleButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var LoginView1 = LoginView().then { _ in }
    var loginModel = LoginModel()
    
    @objc
    private func loginButtonDidTap() {
        guard let id = LoginView1.idInput.text, !id.isEmpty else { return }
        loginModel.savedId(id)
        
        guard let pwd = LoginView1.pwdInput.text, !pwd.isEmpty else { return }
        loginModel.savedPwd(pwd)
        
        goHome()
    }
    
    func goHome() {
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true)
    }
    
    @objc
    private func kakaoBtndidTap() {
        KakaoLogin()
    }
    
    func kakaoLonginWithApp() {
        UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoTalk() success.")
                self.saveInfo(oauthToken: oauthToken)
                self.goHome()
            }
        }
    }
    
    func kakaoLoginWithAccount() {
        
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                self.saveInfo(oauthToken: oauthToken)
                self.goHome()
            }
        }
    }
    
    func KakaoLogin() {
        // 카카오톡 실행 가능 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카카오톡 앱으로 로그인 인증
            kakaoLonginWithApp()
        } else { // 카톡이 설치가 안 되어 있을 때
            // 카카오 계정으로 로그인
            kakaoLoginWithAccount()
        }
    }
    
    private func saveInfo(oauthToken: OAuthToken?) {
           guard let token = oauthToken?.accessToken else { return }
           
           // 사용자 정보 요청
           UserApi.shared.me { (user, error) in
               if let error = error {
                   print("Failed to fetch user info: \(error)")
               } else {
                   if let user = user {
                       let nickname = user.kakaoAccount?.profile?.nickname ?? "닉네임 없음"
                       let profileImageURL = user.kakaoAccount?.profile?.profileImageUrl?.absoluteString ?? ""
                       // 키체인에 저장
                       
                       self.saveInfoKeychain1(token: token, nickname: nickname, profileImageURL: profileImageURL)
                       
                       /*self.saveInfoKeychain(key: "kakao_nickname", value: nickname)
                       self.saveInfoKeychain(key: "kakao_token", value: token)
                       if !profileImageURL.isEmpty {
                           self.saveInfoKeychain(key: "kakao_profile_image", value: profileImageURL)
                       }*/
                       print("Nickname and token saved to Keychain")
                   }
               }
           }
       }
    
    func saveInfoKeychain1(token: String? ,nickname: String?, profileImageURL: String?) {
        if let token = token {
            KeychainHelper.shared.save(Data(token.utf8), key: "kakao_token")
        }
        if let nickname = nickname {
            KeychainHelper.shared.save(Data(nickname.utf8), key: "kakao_nickname")
        }
        if let profileImageURL = profileImageURL {
            KeychainHelper.shared.save(Data(profileImageURL.utf8), key: "kakao_profile_image")
        }
    }

    //토큰과 닉네임, 프로필사진 저장
        func saveInfoKeychain(key: String, value: String){
            
            guard let data = value.data(using: .utf8) else { return }
            
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key,
                kSecValueData as String: data
            ]
            
            // 기존 값이 있으면 업데이트, 없으면 추가
            SecItemDelete(query as CFDictionary) // 기존 항목 삭제
            let status = SecItemAdd(query as CFDictionary, nil)
            
            if status == errSecSuccess {
                print("\(key) successfully saved to Keychain")
            } else {
                print("Failed to save \(key) to Keychain: \(status)")
            }
        }
    
}
