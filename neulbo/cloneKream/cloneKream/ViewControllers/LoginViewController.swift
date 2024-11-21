//
//  ViewController.swift
//  cloneKream
//
//  Created by 김서현 on 10/2/24.
//

import UIKit
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    let keychainService = KeychainService.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginView)
        
        loginView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        loginView.addAction()
        
        loginView.buttonAction = { [weak self] in
            self?.goToNextViewController()
        }
        
        loginView.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginTapped), for: .touchUpInside)
        
    }
    
    private func goToNextViewController() {
        let nextViewController = BaseViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true, completion: nil)
    }
    
    @objc func kakaoLoginTapped() {
        var nickname = ""
        
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                //do something
                if let token = oauthToken {
                    // 액세스 토큰 저장 (Face ID 또는 Touch ID로 접근)
                    let saveAccessTokenStatus = self.keychainService.saveToken(token: token.accessToken, name: "AccessToken", service: "com.login.accessToken")

                    // 리프레시 토큰 저장 (Face ID 또는 Touch ID로 접근)
                    let saveRefreshTokenStatus = self.keychainService.saveToken(token: token.refreshToken, name: "RefreshToken", service: "com.login.refreshToken")
                }
                
                UserApi.shared.me() {(user, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("me() success.")
                        
                        //do something
                        let userName = user?.kakaoAccount?.profile?.nickname
                        
                        nickname = userName ?? ""
                        
                        let saveNickName = self.keychainService.saveNicknameToKeychain(nickname: nickname)
                        
                    }
                }
                self.goToNextViewController()
            }
            
            
        }
        
    }

    
        


}

