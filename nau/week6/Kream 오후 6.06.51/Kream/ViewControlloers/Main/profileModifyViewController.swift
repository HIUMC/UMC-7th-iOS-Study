//
//  profileManageViewController.swift
//  Kream
//
//  Created by KoNangYeon on 10/7/24.
//

import UIKit
import Then

class profileModifyViewController: UIViewController {
    
    var loginModel = LoginModel()
    
    var changeBefore = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileModifyView1
        loadLoginValue()
        
        self.navigationItem.hidesBackButton = true
        
    }
    
    @objc func changeBtn1DidTap(){
        profileModifyView1.do(){
            if changeBefore == true {//변경 누를때
                $0.userIdInput.text = ""
                $0.changeBtn1.setTitle("확인", for: .normal)
                $0.userIdInput.isUserInteractionEnabled = true
                changeBefore = false
            }
            
            else {//확인을 누를때
                guard let id = $0.userIdInput.text , !id.isEmpty else {
                    return
                }
                loginModel.savedId(id)
                
                $0.changeBtn1.setTitle("변경", for: .normal)
                $0.userPwdInput.isUserInteractionEnabled = false
                changeBefore = true
            }
        }
    }
    
    @objc func changeBtn2DidTap(){
        profileModifyView1.do(){
            if changeBefore == true {//변경을 누를때
                $0.userPwdInput.text = ""
                $0.changeBtn2.setTitle("확인", for: .normal)
                $0.userPwdInput.isUserInteractionEnabled = true
                changeBefore = false
            }
            
            else {//확인을 누를때
                guard let pwd = $0.userPwdInput.text , !pwd.isEmpty else {
                    return
                }
                loginModel.savedPwd(pwd)
                
                $0.changeBtn2.setTitle("변경", for: .normal)
                $0.userPwdInput.isUserInteractionEnabled = false
                changeBefore = true
            }
        }
    }
    
    
    
    @objc
    private func backBtnDidTap(){
        self.navigationController?.popViewController(animated: true)
    }
    
    private lazy var profileModifyView1 : profileModifyView = {
        let view = profileModifyView()
        view.backBtn.addTarget(self, action: #selector(backBtnDidTap), for: .touchUpInside)
        
        view.changeBtn1.addTarget(self, action: #selector(changeBtn1DidTap), for: .touchUpInside)
        view.changeBtn2.addTarget(self, action: #selector(changeBtn2DidTap), for: .touchUpInside)
        
        view.backBtn.addTarget(self, action: #selector(backBtnDidTap), for: .touchUpInside)
        
        return view
    }()
    
    private func loadLoginValue() {
        if let id = loginModel.loadId() {
            profileModifyView1.userIdInput.text = id
        }
            
        if let pwd = loginModel.loadPwd() {
            profileModifyView1.userPwdInput.text = pwd
        }
    }
}
