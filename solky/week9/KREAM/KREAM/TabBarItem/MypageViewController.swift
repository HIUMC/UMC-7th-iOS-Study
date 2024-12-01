//
//  MypageViewController.swift
//  KREAM
//
//  Created by 이태림 on 10/8/24.
//

import UIKit

class MypageViewController: UIViewController {
    
    private lazy var myview: MypageView = {
            let view = MypageView()
            return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myview
        updateNicknameLabel()
        myview.profilemanageButton.addTarget(self, action: #selector(manage), for: .touchUpInside)
    }
    
    @objc
    private func manage() {
        let viewcontroller = ProfileManageViewController()
        
        viewcontroller.receivedData = myview.profileImage.image
        
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    func updateNicknameLabel() {
        if let nickname = KeychainService.shared.loadToken(key: "nickname") {
            myview.nicknameLabel.text = nickname
        } else {
            myview.nicknameLabel.text = "닉네임 없음"
        }
    }
}
