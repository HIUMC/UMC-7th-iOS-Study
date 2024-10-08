//
//  ViewController.swift
//  KREAM
//
//  Created by 이태림 on 10/3/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var logView: LoginView = {
            let view = LoginView()
            view.backgroundColor = .white
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
        
        viewcontroller.modalPresentationStyle = .fullScreen
        
        present(viewcontroller, animated: true)
    }
}

