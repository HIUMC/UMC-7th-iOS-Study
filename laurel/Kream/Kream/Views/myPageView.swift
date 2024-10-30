//
//  myPageView.swift
//  Kream
//
//  Created by 어진 on 10/9/24.
//

import Foundation
import UIKit
import SnapKit

class MyPageView: UIView {
    
    let settingsButton = UIButton()
    let cameraButton = UIButton()
    let profileImageView = UIImageView()
    let userNameLabel = UILabel()
    let followLabel = UILabel()
    let manageProfileButton = UIButton()
    let shareProfileButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = .white
        
        // 설정 아이콘
        let settingsImage = UIImage(systemName: "gearshape")
        settingsButton.setImage(settingsImage, for: .normal)
        settingsButton.tintColor = .black
        addSubview(settingsButton)
        
        // 카메라 아이콘
        let cameraImage = UIImage(systemName: "camera")
        cameraButton.setImage(cameraImage, for: .normal)
        cameraButton.tintColor = .black
        addSubview(cameraButton)
        
        // 프로필 이미지
        profileImageView.image = UIImage(named: "profileImage")
        profileImageView.layer.cornerRadius = 40
        profileImageView.layer.masksToBounds = true
        addSubview(profileImageView)
        
        // 유저 이름
        userNameLabel.text = "Jeong_iOS"
        userNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        userNameLabel.textColor = .black
        
        // 팔로워, 팔로잉 라벨
        followLabel.text = "팔로워 326  팔로잉 20"
        followLabel.font = UIFont.systemFont(ofSize: 14)
        followLabel.textColor = .black
        
        // 수직 스택뷰에 유저 이름과 팔로워/팔로잉 라벨 추가
        let textStackView = UIStackView(arrangedSubviews: [userNameLabel, followLabel])
        textStackView.axis = .vertical
        textStackView.alignment = .leading
        textStackView.spacing = 5
        addSubview(textStackView)
        
        // 프로필 관리 버튼
        manageProfileButton.setTitle("프로필 관리", for: .normal)
        manageProfileButton.setTitleColor(.black, for: .normal)
        manageProfileButton.layer.borderWidth = 1
        manageProfileButton.layer.borderColor = UIColor.lightGray.cgColor
        manageProfileButton.layer.cornerRadius = 10
        addSubview(manageProfileButton)
        
        // 프로필 공유 버튼
        shareProfileButton.setTitle("프로필 공유", for: .normal)
        shareProfileButton.setTitleColor(.black, for: .normal)
        shareProfileButton.layer.borderWidth = 1
        shareProfileButton.layer.borderColor = UIColor.lightGray.cgColor
        shareProfileButton.layer.cornerRadius = 10
        addSubview(shareProfileButton)
        
        // SnapKit 레이아웃 설정
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(self).offset(32.5)
            make.width.height.equalTo(24)
        }
        
        cameraButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self).offset(-32.5)
            make.width.height.equalTo(24)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(settingsButton.snp.bottom).offset(40)
            make.leading.equalTo(self).offset(50)
            make.width.height.equalTo(80)
        }
        
        textStackView.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView)
            make.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }
        
        manageProfileButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(30)
            make.trailing.equalTo(self.snp.centerX).offset(-7)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
        
        shareProfileButton.snp.makeConstraints { make in
            make.top.equalTo(manageProfileButton.snp.top)
            make.leading.equalTo(self.snp.centerX).offset(7)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
    }
}
