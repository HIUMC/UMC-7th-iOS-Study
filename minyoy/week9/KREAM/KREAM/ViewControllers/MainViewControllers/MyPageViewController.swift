//
//  MyPageViewController.swift
//  KREAM
//
//  Created by 주민영 on 10/8/24.
//

import UIKit
import KakaoSDKUser

class MyPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myPageView
        displayNickname()
    }
    
    private lazy var myPageView: MyPageView = {
        let view = MyPageView()
        
        displayImage()
        view.profileManagerButton.addTarget(self, action: #selector(btnDidTap), for: .touchUpInside)
        
        return view
    }()
    
    @objc
    private func btnDidTap() {
        let profileManagerVC = ProfileManagerViewController()
        
        profileManagerVC.receivedData = myPageView.profileImage.image
        
        navigationController?.pushViewController(profileManagerVC, animated: true)
    }
    
    func displayNickname() {
        if let nickname = KaKaoKeychainService.shared.loadNickname() {
            myPageView.nameTitleLabel.text = nickname
        } else {
            myPageView.nameTitleLabel.text = "닉네임 정보를 불러올 수 없습니다."
        }
    }
    
    func displayImage() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                let response = user?.kakaoAccount?.profile?.profileImageUrl
                
                DispatchQueue.global().async { [weak self] in
                    if let data = try? Data(contentsOf: response!) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self?.myPageView.profileImage.image = image
                            }
                        }
                    }
                }
            }
        }
    }
}
