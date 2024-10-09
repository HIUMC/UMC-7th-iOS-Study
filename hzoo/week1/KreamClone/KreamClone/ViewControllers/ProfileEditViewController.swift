//
//  ProfileEditViewController.swift
//  KreamClone
//
//  Created by 이현주 on 10/7/24.
//

import UIKit

class ProfileEditViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.view = profileManageView
        
        let titleLabel = UILabel()
        titleLabel.text = "프로필 관리"
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = .black
        navigationItem.titleView = titleLabel
    
        let backbutton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .done, target: self, action: #selector(goToBack))
        self.navigationItem.leftBarButtonItem = backbutton
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    @objc
    private func goToBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private lazy var profileManageView: ProfileManageView = {
        let v = ProfileManageView()
        v.emailCheckBtn.addTarget(self, action: #selector(emailChange), for: .touchUpInside)
        v.pwdCheckBtn.addTarget(self, action: #selector(pwdChange), for: .touchUpInside)
        return v
    }()
    
    @objc
    private func emailChange() {
        profileManageView.emailCheckBtn.setTitle("확인", for: .normal)
        profileManageView.emailTextField.text = ""
        profileManageView.emailTextField.resignFirstResponder()
    }
    
    @objc
    private func pwdChange() {
        profileManageView.pwdCheckBtn.setTitle("확인", for: .normal)
        profileManageView.pwdTextField.text = ""
        profileManageView.pwdTextField.resignFirstResponder()
    }
}
