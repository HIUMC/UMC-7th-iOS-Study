//
//  ViewController.swift
//  KREAM
//
//  Created by 이태림 on 10/3/24.
//

import UIKit
import Alamofire
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKCommon


class LoginViewController: UIViewController {
    
    private let loginModel = LoginModel()
    
    private lazy var logView: LoginView = {
        let view = LoginView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = logView
       
        logView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        logView.kakaologinButton.addTarget(self, action: #selector(KakaoLogin), for: .touchUpInside)
    }
    
    @objc
    private func login() {
        
        guard let email = logView.idTextField.text, !email.isEmpty else { return }
        guard let password = logView.pwdTextField.text, !password.isEmpty else { return }
        
        loginModel.saveUserEmail(email)
        loginModel.saveUserPassword(password)
        
        gethomeview()
    }
    
    
    @objc private func KakaoLogin() {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else if let oauthToken = oauthToken {
                KeychainService.shared.saveToken(value: oauthToken.accessToken, key: "accessToken")
                KeychainService.shared.saveToken(value: oauthToken.refreshToken, key: "refreshToken")
                
                self.gethomeview()
                self.getusernickname(accessToken: oauthToken.accessToken)
            }
        }
    }
    
    
    private func getusernickname(accessToken: String) {
        let url = "https://kapi.kakao.com/v2/user/me"
                
        APIClient.shared.request(url, method: .get) { (result: Result<UserModel, Error>) in
            switch result {
            case .success(let usermodel):
                KeychainService.shared.saveToken(value: usermodel.properties?.nickname ?? "", key: "nickname")
            case .failure(let error):
                    print("네트워킹 오류: \(error)")
            }
        }
    }
    
    
    private func gethomeview() {
            let viewcontroller = MainViewController()
            viewcontroller.modalPresentationStyle = .fullScreen
            present(viewcontroller, animated: true)
    }
}

