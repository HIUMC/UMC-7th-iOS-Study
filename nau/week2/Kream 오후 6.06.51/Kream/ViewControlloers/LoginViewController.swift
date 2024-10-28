//
//  ViewController.swift
//  Kream
//
//  Created by KoNangYeon on 9/30/24.
//

import UIKit
import Then

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = LoginView1
        
        LoginView1.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        
        LoginView1.loginKakaoButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        
        LoginView1.loginAppleButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }

    private lazy var LoginView1 = LoginView().then {_ in}
    var loginModel = LoginModel()
    
    @objc
    private func loginButtonDidTap() {
        LoginView1.do(){_ in 
            guard let id = LoginView1.idInput.text , !id.isEmpty else {
                return
            }
            LoginModel().savedId(id)
            
            guard let pwd = LoginView1.pwdInput.text , !pwd.isEmpty else {
                return
            }
            LoginModel().savedPwd(pwd)
        }
        
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true)
    }
}

