//
//  ViewController.swift
//  Kream
//
//  Created by KoNangYeon on 9/30/24.
//

import UIKit
import Then
import Alamofire
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

        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true)
    }
    
    @objc
       private func kakaoBtndidTap() {
           APIClient.shared.KakaoLogin { [weak self] result in
               switch result {
               case .success(let oauthToken):
                   self?.KakaoLoginSuccess(oauthToken: oauthToken)
               case .failure(let error):
                   print("카카오 로그인 실패: \(error.localizedDescription)")
               }
           }
       }

       private func KakaoLoginSuccess(oauthToken: OAuthToken) {
           
           APIClient.shared.fetchKakaoUserProfile { result in
               switch result {
               case .success(let nickname):
                   print("사용자 닉네임: \(nickname)")
                   //self.saveLoginData(accessToken: "accessToken", nickname: oauthToken.accessToken)
                   self.saveLoginData(accessToken: "accessToken", nickname: nickname)
                   self.loginModel.savedNickname(nickname)
                   self.viewChange()
               case .failure(let error):
                   print("사용자 정보 가져오기 실패: \(error.localizedDescription)")
               }
           }
       }

       private func viewChange() {
           let mainVC = MainViewController()
           mainVC.modalPresentationStyle = .fullScreen
           self.present(mainVC, animated: true)
       }


    func saveLoginData(accessToken: String, nickname: String) {
        let service = "com.yourapp.kakao"

        if let tokenData = accessToken.data(using: .utf8) {
            KeychainHelper.shared.save(tokenData, service: service, account: "accessToken")
        }

        if let nicknameData = nickname.data(using: .utf8) {
            KeychainHelper.shared.save(nicknameData, service: service, account: "nickname")
        }
    }
}
