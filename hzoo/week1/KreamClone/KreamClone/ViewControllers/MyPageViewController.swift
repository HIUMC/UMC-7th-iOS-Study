//
//  MyPageViewController.swift
//  KreamClone
//
//  Created by 이현주 on 10/7/24.
//

import UIKit

class MyPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mypageView
    }
    
    private lazy var mypageView: MyPageView = {
        let v = MyPageView()
        v.profileManage.addTarget(self, action: #selector(profileMgBtnTapped), for: .touchUpInside)
        return v
    }()
    
    @objc
    private func profileMgBtnTapped() {
        let vc = ProfileEditViewController()
        vc.profileManageView.profileImg.image = mypageView.profileImg.image
        navigationController?.pushViewController(vc, animated: true)
    }
}
