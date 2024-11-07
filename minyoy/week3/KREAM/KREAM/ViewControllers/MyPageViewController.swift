//
//  MyPageViewController.swift
//  KREAM
//
//  Created by 주민영 on 10/8/24.
//

import UIKit

class MyPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myPageView
    }
    
    private lazy var myPageView: MyPageView = {
        let view = MyPageView()
        view.profileManagerButton.addTarget(self, action: #selector(btnDidTap), for: .touchUpInside)
        
        return view
    }()
    
    @objc
    private func btnDidTap() {
        let profileManagerVC = ProfileManagerViewController()
        
        profileManagerVC.receivedData = myPageView.profileImage.image
        
        navigationController?.pushViewController(profileManagerVC, animated: true)
    }

}
