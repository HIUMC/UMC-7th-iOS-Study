//
//  MYViewController.swift
//  Kream
//
//  Created by KoNangYeon on 10/6/24.
//

import UIKit

class MYViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = MYView1
        navigationController?.isNavigationBarHidden = true
    }
    
    private lazy var MYView1 = MYView().then(){
        $0.profileManageButton.addTarget(self, action: #selector(profileManageBtnDidTap), for: .touchUpInside)
    }
    
    @objc
    private func profileManageBtnDidTap(){
        let profileModifyVC = profileModifyViewController()
        navigationController?.pushViewController(profileModifyVC, animated: true)
    }
}
