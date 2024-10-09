//
//  ViewController.swift
//  Kream
//
//  Created by KoNangYeon on 9/30/24.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = LoginView1
        
        LoginView1.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        
        LoginView1.loginKakaoButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        
        LoginView1.loginAppleButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }

    private lazy var LoginView1: LoginView = {
        let view = LoginView()
        return view
    }()
    
    @objc
    private func loginButtonDidTap() {
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true)
    }
}

