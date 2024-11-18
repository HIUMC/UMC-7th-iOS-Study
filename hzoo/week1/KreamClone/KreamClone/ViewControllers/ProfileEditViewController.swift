//
//  ProfileEditViewController.swift
//  KreamClone
//
//  Created by 이현주 on 10/7/24.
//

import UIKit

class ProfileEditViewController: UIViewController {

    private let loginModel = LoginModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.view = profileManageView
        
        let titleLabel = UILabel()
        titleLabel.text = "프로필 관리"
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = .black
        navigationItem.titleView = titleLabel
    
        navigationController?.isNavigationBarHidden = false
        let backbutton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .done, target: self, action: #selector(goToBack))
        self.navigationItem.leftBarButtonItem = backbutton
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    @objc
    private func goToBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    public lazy var profileManageView: ProfileManageView = {
        let v = ProfileManageView()
        v.emailCheckBtn.addTarget(self, action: #selector(emailChange), for: .touchUpInside)
        v.pwdCheckBtn.addTarget(self, action: #selector(pwdChange), for: .touchUpInside)
        v.emailTextField.text = loginModel.loadEmailText()
        v.emailTextField.isUserInteractionEnabled = false
        v.pwdTextField.text = loginModel.loadPwText()
        v.pwdTextField.isUserInteractionEnabled = false
        return v
    }()
    
    @objc
    private func emailChange() {
        if profileManageView.emailCheckBtn.titleLabel?.text == "변경" {
            profileManageView.emailTextField.isUserInteractionEnabled = true
            profileManageView.emailCheckBtn.setTitle("확인", for: .normal)
            profileManageView.emailTextField.text = ""
            profileManageView.emailTextField.resignFirstResponder()
        }
        else if profileManageView.emailCheckBtn.titleLabel?.text == "확인" {
            guard let email = profileManageView.emailTextField.text, !email.isEmpty else {
                return
            }
            loginModel.saveEmailText(email)
            profileManageView.emailTextField.text = loginModel.loadEmailText()
            profileManageView.emailTextField.isUserInteractionEnabled = false
            profileManageView.emailCheckBtn.setTitle("변경", for: .normal)
        }
    }
    
    @objc
    private func pwdChange() {
        if profileManageView.pwdCheckBtn.titleLabel?.text == "변경" {
            profileManageView.pwdTextField.isUserInteractionEnabled = true
            profileManageView.pwdCheckBtn.setTitle("확인", for: .normal)
            profileManageView.pwdTextField.text = ""
            profileManageView.pwdTextField.resignFirstResponder()
        }
        else if profileManageView.pwdCheckBtn.titleLabel?.text == "확인" {
            guard let pw = profileManageView.pwdTextField.text, !pw.isEmpty else {
                return
            }
            loginModel.savePwText(pw)
            profileManageView.pwdTextField.text = loginModel.loadPwText()
            profileManageView.pwdTextField.isUserInteractionEnabled = false
            profileManageView.pwdCheckBtn.setTitle("변경", for: .normal)        }
    }
}
