//
//  LoginViewController.swift
//  Kream
//
//  Created by 어진 on 10/3/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // LoginView 설정
        let loginView = LoginView()
        loginView.onLoginButtonTapped = { [weak self] in
            self?.navigateToMainTabBar()
        }
        self.view = loginView
    }
    
    private func navigateToMainTabBar() {
        let tabBarController = MyTabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true, completion: nil)
    }
}



