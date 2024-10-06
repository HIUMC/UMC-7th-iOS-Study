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
        return v
    }()


}

