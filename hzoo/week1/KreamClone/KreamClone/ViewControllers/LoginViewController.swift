//
//  ViewController.swift
//  KreamClone
//
//  Created by 이현주 on 10/2/24.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    private let loginModel = LoginModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    private lazy var loginView: LoginView = {
        let v = LoginView()
        v.loginButton.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        v.kakaoLogin.addTarget(self, action: #selector(kakaoBtnTapped), for: .touchUpInside)
        return v
    }()
    
    private func presentToHome() {
        let vc = BaseViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc
    private func loginBtnTapped() {
        
        guard let email = loginView.emailTextField.text, !email.isEmpty else {
            return
        }
        
        guard let pw = loginView.pwdTextField.text, !pw.isEmpty else {
            return
        }

        // 모델을 통해 email, pw 저장합니다.
        loginModel.saveEmailText(email)
        loginModel.savePwText(pw)
        
        presentToHome()
    }
    
    @objc
    private func kakaoBtnTapped() {
        // 카카오톡 실행 가능 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) { //앱으로 카카오 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    KeychainService.shared.saveToken(token: oauthToken?.accessToken ?? "", account: "", service: "kakaoAccess")
                    KeychainService.shared.saveToken(token: oauthToken?.refreshToken ?? "", account: "", service: "kakaoRefresh")
                    print("저장 잘 완료")
                    self.presentToHome()
                }
            }
        } else { //웹 브라우저로 카카오 로그인
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    KeychainService.shared.saveToken(token: oauthToken?.accessToken ?? "", account: "", service: "kakaoAccess")
                    KeychainService.shared.saveToken(token: oauthToken?.refreshToken ?? "", account: "", service: "kakaoRefresh")
                    print("저장 잘 완료")
                    self.presentToHome()
                }
            }
        }
    }
}

