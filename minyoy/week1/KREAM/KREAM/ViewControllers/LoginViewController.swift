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
        return view
    }()

}

