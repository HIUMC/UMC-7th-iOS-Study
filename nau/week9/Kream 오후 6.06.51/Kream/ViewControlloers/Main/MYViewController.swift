//
//  MYViewController.swift
//  Kream
//
//  Created by KoNangYeon on 10/6/24.
//

import UIKit
import Kingfisher

class MYViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = MYView1
        navigationController?.isNavigationBarHidden = true
        changeNickname()
    }
    
    private lazy var MYView1 = MYView().then(){
        $0.profileManageButton.addTarget(self, action: #selector(profileManageBtnDidTap), for: .touchUpInside)
    }
    
    @objc
    private func profileManageBtnDidTap(){
        let profileModifyVC = profileModifyViewController()
        
        profileModifyVC.profileImage = MYView1.profileImage.image // 현재 마이뷰 프로필 사진 전달
        
        navigationController?.pushViewController(profileModifyVC, animated: true)
    }
    
    //키체인 작업을 메인 스레드에서 처리하지 않고, 백그라운드 스레드에서 처리한 후 결과를 메인스레드에서 UI에 반영하도록 수젇함!!
    private func changeNickname() {
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                if let nickname = KeychainHelper.shared.loadValue(key: "kakao_nickname"), let profileImageURL = URL(string: KeychainHelper.shared.loadValue(key: "kakao_profile_image") ?? "") {
                    DispatchQueue.main.async {
                        self?.MYView1.ProfileNicName.text = nickname
                        self?.MYView1.profileImage.kf.setImage(with: profileImageURL)
                    }
                }
            }
        }
    
}
