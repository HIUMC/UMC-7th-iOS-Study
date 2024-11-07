//
//  MyPageViewController.swift
//  Kream
//
//  Created by 어진 on 10/9/24.
//

import UIKit

class MyPageViewController: UIViewController {
    
    let myPageView = MyPageView()
    
    override func loadView() {
        self.view = myPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // manageProfileButton 클릭 시 ProfileEditViewController로 이동하는 클로저 설정
        myPageView.onManageProfileButtonTapped = { [weak self] in
            guard let self = self else { return }
            let profileEditVC = ProfileEditViewController()
            self.navigationController?.pushViewController(profileEditVC, animated: true)
        }
    }
}



