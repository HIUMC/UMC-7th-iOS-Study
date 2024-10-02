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
        
        // LoginView를 뷰 컨트롤러의 뷰로 설정
        let loginView = LoginView(frame: self.view.bounds)
        self.view = loginView 
    }
}

