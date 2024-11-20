//
//  ViewController.swift
//  KREAM
//
//  Created by 주민영 on 10/1/24.
//

import UIKit
import Alamofire
import KakaoSDKCommon
import KakaoSDKUser

class LoginViewController: UIViewController {
    private let loginModel = LoginModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.localLoginButton.addTarget(self, action: #selector(LocalLogin), for: .touchUpInside)
        view.kakaoLoginButton.addTarget(self, action: #selector(KakaoLogin), for: .touchUpInside)
        return view
    }()
    
    private func goHome() {
        let tabBarVC = TabBarViewController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
    
    @objc private func LocalLogin() {
        guard let id = loginView.idTextField.text , !id.isEmpty else {
            return
        }
        loginModel.saveUserId(id)
        
        guard let pwd = loginView.pwdTextField.text , !pwd.isEmpty else {
            return
        }
        loginModel.saveUserPwd(pwd)
        
        goHome()
    }
    
    @objc private func KakaoLogin() {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else if let oauthToken = oauthToken {
                KaKaoKeychainService.shared.saveToken(key: "accessToken", value: oauthToken.accessToken)
                KaKaoKeychainService.shared.saveToken(key: "refreshToken", value: oauthToken.refreshToken)
                
                self.fetchNickname(accessToken: oauthToken.accessToken)
                self.goHome()
            }
        }
    }
        
    private func fetchNickname(accessToken: String) {
        let url = "https://kapi.kakao.com/v2/user/me"
        let headers: HTTPHeaders = ["Authorization": "Bearer \(accessToken)"]
        
        APIClient.shared.request(url, method: .get, headers: headers) { (result: Result<KaKaoUserInfo, Error>) in
            switch result {
            case .success(let response):
                KaKaoKeychainService.shared.saveToken(key: "nickname", value: response.properties?.nickname ?? "")
            case .failure(let error):
                print("네트워킹 오류: \(error)")
            }
        }
    }
}

