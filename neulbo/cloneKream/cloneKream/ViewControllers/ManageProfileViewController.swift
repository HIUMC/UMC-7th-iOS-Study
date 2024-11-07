//
//  ManageProfileViewController.swift
//  cloneKream
//
//  Created by 김서현 on 10/3/24.
//

import UIKit

class ManageProfileViewController: UIViewController {
    
    public let manageProfileView = ManageProfileView()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(manageProfileView)
        
        
        manageProfileView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        self.title = "프로필 관리"
        
        self.manageProfileView.emailTextField.isUserInteractionEnabled = false
        self.manageProfileView.pwdTextField.isUserInteractionEnabled = false
        
        
        manageProfileView.emailChangeButton.addTarget(self, action: #selector(textFieldTapped), for: .touchUpInside)
        manageProfileView.pwdChangeButton.addTarget(self, action: #selector(textFieldTapped), for: .touchUpInside)
        


    }
    
    
    @objc private func textFieldTapped() {
        if manageProfileView.emailTextField.isUserInteractionEnabled == true {
            manageProfileView.emailTextField.isUserInteractionEnabled = false
            manageProfileView.pwdTextField.isUserInteractionEnabled = false
            manageProfileView.saveTextField()
        } else {
            manageProfileView.emailTextField.isUserInteractionEnabled = true
            manageProfileView.pwdTextField.isUserInteractionEnabled = true
            manageProfileView.changeTextField()
        }
        
    }
    





}
