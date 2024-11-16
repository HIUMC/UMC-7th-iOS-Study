//
//  ViewController.swift
//  KREAM
//
//  Created by 이태림 on 10/3/24.
//

import UIKit

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
    }
    
    @objc
    private func login() {
        let viewcontroller = MainViewController()
        guard let email = logView.idTextField.text, !email.isEmpty else { return }
        guard let password = logView.pwdTextField.text, !password.isEmpty else { return }
        
        loginModel.saveUserEmail(email)
        loginModel.saveUserPassword(password)
        
        viewcontroller.modalPresentationStyle = .fullScreen
        
        present(viewcontroller, animated: true)
    }
    
}

