//
//  MyPageViewController.swift
//  MyKream
//
//  Created by 김호성 on 2024.10.03.
//

import UIKit
import SnapKit

class MyPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MyPageViewController")
        
        self.view = myPageView
        navigationController?.isNavigationBarHidden = true
    }
    
    private lazy var myPageView: MyPageView = {
        let view = MyPageView()
        
        view.btnManageProfile.addTarget(self, action: #selector(onClickManageProfile), for: .touchUpInside)
//        view.btnShareProfile.addTarget(self, action: #selector(), for: .touchUpInside)
        
        return view
    }()
    
    @objc func onClickManageProfile() {
        let viewController = ManageProfileViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
