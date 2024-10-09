//
//  ViewController.swift
//  KreamClone
//
//  Created by 이현주 on 10/2/24.
//

import UIKit

class LoginViewController: UIViewController {

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
        let vc = BaseViewController()

        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }
}

