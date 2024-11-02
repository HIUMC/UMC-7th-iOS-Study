//
//  ViewController.swift
//  KreamClone
//
//  Created by 이현주 on 10/2/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginModel = LoginModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    private lazy var loginView: LoginView = {
        let v = LoginView()
        v.loginButton.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        return v
    }()
    
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
        
        let vc = BaseViewController()

        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }
}

