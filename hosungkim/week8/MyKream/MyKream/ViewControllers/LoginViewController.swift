//
//  ViewController.swift
//  MyKream
//
//  Created by 김호성 on 2024.09.24.
//

import UIKit
import KakaoSDKUser
import KakaoSDKAuth

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view = loginView
        self.hideKeyboardWhenTappedAround()
    }
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.btnLogin.addTarget(self, action: #selector(onClickLogin), for: .touchUpInside)
        view.btnKakaoLogin.addTarget(self, action: #selector(onClickKakaoLogin), for: .touchUpInside)
        view.btnAppleLogin.addTarget(self, action: #selector(onClickAppleLogin), for: .touchUpInside)
        return view
    }()
    
    @objc func onClickLogin() {
        print("onClickLogin")
        
        if let id = loginView.tfEmail.text, let password = loginView.tfPassword.text {
            AccountManager.shared.loginModel = LoginModel(id: id, password: password)
            AccountManager.shared.loginModel?.saveToUserDefaults()
        } else {
            AccountManager.shared.loginModel = LoginModel()
        }
        
        let viewController = BaseViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    @objc func onClickKakaoLogin() {
        print("onClickKakaoLogin")
        
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk { [weak self] oauthToken, error in
                self?.processKakaoLogin(oauthToken: oauthToken, error: error)
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { [weak self] (oauthToken, error) in
                self?.processKakaoLogin(oauthToken: oauthToken, error: error)
            }
        }
    }
    
    private func processKakaoLogin(oauthToken:OAuthToken?, error:Error?) {
        if let error = error {
            fatalError("kakao login error: \(error)")
        }
        AccountManager.shared.accessToken = oauthToken?.accessToken ?? ""
        AccountManager.shared.refreshToken = oauthToken?.refreshToken ?? ""
        
        let viewController = BaseViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    @objc func onClickAppleLogin() {
        print("onClickAppleLogin")
    }
    
    private func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

