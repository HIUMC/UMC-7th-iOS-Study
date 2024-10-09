//
//  profileManageViewController.swift
//  Kream
//
//  Created by KoNangYeon on 10/7/24.
//

import UIKit

class profileModifyViewController: UIViewController {
    public lazy var backBtn = UIButton().then {
        var config = UIButton.Configuration.plain()
        
        config.background.image = UIImage(systemName: "arrow.backward")?.withTintColor(UIColor.black).withRenderingMode(.alwaysOriginal)
        $0.configuration = config
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileModifyView1
        
        profileModifyView1.changeBtn1.addTarget(self, action: #selector(changeBtn1DidTap), for: .touchUpInside)
        
        profileModifyView1.changeBtn2.addTarget(self, action: #selector(changeBtn2DidTap), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
        backBtn.addTarget(self, action: #selector(backBtnDidTap), for: .touchUpInside)
        
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileModifyView1.backBtn)
        
        //profileModifyView1.backBtn.addTarget(self, action: #selector(backBtnDidTap), for: .touchUpInside)
    }
    
    private lazy var profileModifyView1: profileModifyView = {
        let view = profileModifyView()
        return view
    }()
    
    @objc func changeBtn1DidTap(){
        profileModifyView1.userIdInput.text = ""
        
        var config = UIButton.Configuration.plain()
        
        config.attributedTitle = AttributedString("확인", attributes: profileModifyView1.changeBtnTitle)
        config.titleAlignment = .center
        
        profileModifyView1.changeBtn1.configuration = config
    }
    
    @objc func changeBtn2DidTap(){
        profileModifyView1.userPwdInput.text = ""
        
        var config = UIButton.Configuration.plain()
        
        config.attributedTitle = AttributedString("확인", attributes: profileModifyView1.changeBtnTitle)
        config.titleAlignment = .center
        
        profileModifyView1.changeBtn2.configuration = config
    }
    
    @objc func backBtnDidTap(){
        self.navigationController?.popViewController(animated: true)
    }
    
    /*@objc func backBtnDidTap(){
        self.navigationController?.popViewController(animated: true)
    }*/

}
