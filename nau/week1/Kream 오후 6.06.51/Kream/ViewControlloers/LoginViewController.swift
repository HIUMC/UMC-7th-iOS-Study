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
    }

    private lazy var LoginView1: LoginView = {
        let view = LoginView()
        return view
    }()

}

