//
//  ProfileManageViewController.swift
//  KREAM
//
//  Created by 이태림 on 10/8/24.
//

import UIKit

class ProfileManageViewController: UIViewController {
  
    private lazy var manageview: ProfileManageView = {
            let view = ProfileManageView()
            view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
            return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = manageview
        self.navigationItem.title = "프로필 관리"
        
        let backButton = UIBarButtonItem(image: UIImage(named: "leftback"), style: .plain, target: self, action: #selector(back))
        backButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = backButton
        
        manageview.emailchangebutton.addTarget(self, action: #selector(change), for: .touchUpInside)
        manageview.passwordchangebutton.addTarget(self, action: #selector(change), for: .touchUpInside)
    }
    
    @objc
    private func back() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func change() {
        manageview.useremailtextfield.attributedPlaceholder = NSAttributedString(string: "새로운 이메일을 입력해주세요!", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1.00), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)])
        manageview.useremailtextfield.font = .systemFont(ofSize: 14, weight: .medium)
        manageview.useremailtextfield.autocapitalizationType = .none
        manageview.useremailtextfield.keyboardType = .emailAddress
        manageview.emailchangebutton.setTitle("확인", for: .normal)
        manageview.userpasswordtextfield.attributedPlaceholder = NSAttributedString(string: "새로운 비밀번호를 입력해주세요!", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1.00), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)])
        manageview.userpasswordtextfield.font = .systemFont(ofSize: 12, weight: .medium)
        manageview.userpasswordtextfield.isSecureTextEntry = true
        manageview.passwordchangebutton.setTitle("확인", for: .normal)
       }


}
