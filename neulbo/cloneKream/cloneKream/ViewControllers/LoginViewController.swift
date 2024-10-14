//
//  ViewController.swift
//  cloneKream
//
//  Created by 김서현 on 10/2/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginView)
        
        loginView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        loginView.addAction()
        
        loginView.buttonAction = { [weak self] in
            self?.goToNextViewController()
        }
        
    }
    
    private func goToNextViewController() {
        let nextViewController = BaseViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true, completion: nil)
    }


}

