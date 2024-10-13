//
//  profileManageViewController.swift
//  Kream
//
//  Created by KoNangYeon on 10/7/24.
//

import UIKit

class profileModifyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileModifyView1
        
        self.navigationItem.hidesBackButton = true
    }
    
    @objc func changeBtn1DidTap(){
        profileModifyView1.do(){
            $0.userIdInput.text = ""
            $0.changeBtn1.setTitle("확인", for: .normal)
        }
    }
    
    @objc func changeBtn2DidTap(){
        profileModifyView1.do(){
            $0.userPwdInput.text = ""
            $0.changeBtn2.setTitle("확인", for: .normal)
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
}
