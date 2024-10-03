//
//  ViewController.swift
//  KREAM
//
//  Created by 이태림 on 10/3/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = logView
    }
    
    private lazy var logView: LoginView = {
            let view = LoginView()
            view.backgroundColor = .white
            return view
    }()
}

