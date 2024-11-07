//
//  ViewController.swift
//  KREAM
//
//  Created by 주민영 on 10/1/24.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.localLoginButton.addTarget(self, action: #selector(btnDidTap), for: .touchUpInside)
        view.kakaoLoginButton.addTarget(self, action: #selector(btnDidTap), for: .touchUpInside)
        view.appleLoginButton.addTarget(self, action: #selector(btnDidTap), for: .touchUpInside)
        
        return view
    }()
    
    @objc
    private func btnDidTap() {
        let tabBarVC = TabBarViewController()
        
        tabBarVC.modalPresentationStyle = .fullScreen
        
        present(tabBarVC, animated: true)
    }
}

