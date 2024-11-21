//
//  MyViewController.swift
//  cloneKream
//
//  Created by 김서현 on 10/2/24.
//

import UIKit

class MyViewController: UIViewController {
    
    private let myProfileView = MyProfileView()
    let keychainService = KeychainService.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(myProfileView)
        
        // 닉네임 읽기
        if let storedNickname = keychainService.getNicknameFromKeychain() {
            myProfileView.userId.text = storedNickname
        }
        
        myProfileView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(297)
        }
        
        myProfileView.addAction()
        
        myProfileView.buttonAction = { [weak self] in
            self?.goToNextViewController()
        }
        
        
        let settingsButton = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(settingButtonTapped))
        self.navigationItem.leftBarButtonItem  = settingsButton
        
        let cameraButton = UIBarButtonItem(image: UIImage(named: "camera"), style: .plain, target: self, action: #selector(cameraButtonTapped))
        self.navigationItem.rightBarButtonItem  = cameraButton
        
        navigationItem.hidesBackButton = true
        
        
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    
    
    private func goToNextViewController() {
        let nextViewController = ManageProfileViewController()
        nextViewController.manageProfileView.profileImageName = self.myProfileView.profileImage.image
        navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
    
    @objc private func settingButtonTapped() {
        
    }
    
    @objc private func cameraButtonTapped() {
        
    }


}
