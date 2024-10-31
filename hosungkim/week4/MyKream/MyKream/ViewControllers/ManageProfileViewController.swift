//
//  ManageProfileViewController.swift
//  MyKream
//
//  Created by 김호성 on 2024.10.07.
//

import UIKit

class ManageProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = manageProfileView
        navigationController?.isNavigationBarHidden = true
        self.hideKeyboardWhenTappedAround()
    }
    
    public lazy var manageProfileView: ManageProfileView = {
        let view = ManageProfileView()
        view.btnBack.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        view.btnUpdateEmail.addTarget(self, action: #selector(onClickUpdateEmail), for: .touchUpInside)
        view.btnUpdatePassword.addTarget(self, action: #selector(onClickUpdatePassword), for: .touchUpInside)
        return view
    }()
    
    @objc func onClickBack() {
        navigationController?.popViewController(animated: true)
    }
    @objc func onClickUpdateEmail() {
        guard let view: ManageProfileView = self.view as? ManageProfileView else {
            return
        }
        view.tfEmail.isUserInteractionEnabled = !view.tfEmail.isUserInteractionEnabled
        if view.tfEmail.isUserInteractionEnabled {
            view.tfEmail.text = ""
            view.btnUpdateEmail.setAttributedTitle(NSAttributedString(string: "확인", attributes: [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 14)]), for: .normal)
            view.tfEmail.becomeFirstResponder()
        } else {
            AccountManager.shared.loginModel?.updateID(view.tfEmail.text ?? "")
            view.btnUpdateEmail.setAttributedTitle(NSAttributedString(string: "변경", attributes: [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 14)]), for: .normal)
        }
        print(AccountManager.shared.loginModel!)
    }
    @objc func onClickUpdatePassword() {
        guard let view: ManageProfileView = self.view as? ManageProfileView else {
            return
        }
        view.tfPassword.isUserInteractionEnabled = !view.tfPassword.isUserInteractionEnabled
        if view.tfPassword.isUserInteractionEnabled {
            view.tfPassword.text = ""
            view.btnUpdatePassword.setAttributedTitle(NSAttributedString(string: "확인", attributes: [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 14)]), for: .normal)
            view.tfPassword.becomeFirstResponder()
        } else {
            AccountManager.shared.loginModel?.updatePassword(view.tfPassword.text ?? "")
            view.btnUpdatePassword.setAttributedTitle(NSAttributedString(string: "변경", attributes: [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 14)]), for: .normal)
        }
        print(AccountManager.shared.loginModel!)
    }
    
    private func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
