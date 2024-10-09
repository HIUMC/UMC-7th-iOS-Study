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
        
        MYView1.profileManageButton.addTarget(self, action: #selector(profileManageBtnDidTap), for: .touchUpInside)
    
    }
    
    private lazy var MYView1 = MYView().then(){_ in }
    
    @objc
    private func profileManageBtnDidTap(){
        let profileModifyVC = profileModifyViewController()
        navigationController?.pushViewController(profileModifyVC, animated: true)
    }
}
