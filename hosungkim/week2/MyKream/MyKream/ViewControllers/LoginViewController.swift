//
//  ViewController.swift
//  MyKream
//
//  Created by 김호성 on 2024.09.24.
//

import UIKit

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
        print("\(loginView.getLoginModel())")
        
        AccountManager.shared.loginModel = loginView.getLoginModel()
        
        let viewController = BaseViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    @objc func onClickKakaoLogin() {
        print("onClickKakaoLogin")
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

