//
//  MyPageViewController.swift
//  Kream
//
//  Created by 어진 on 10/9/24.
//
import UIKit
import SnapKit

//다시 만들기.............................ㅠ

class MyPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 배경 색상 설정
        view.backgroundColor = .white
        
        // 설정 아이콘
        let settingsButton = UIButton()
        let settingsImage = UIImage(systemName: "gearshape")
        settingsButton.setImage(settingsImage, for: .normal)
        settingsButton.tintColor = .black
        view.addSubview(settingsButton)
        
        // 카메라 아이콘
        let cameraButton = UIButton()
        let cameraImage = UIImage(systemName: "camera")
        cameraButton.setImage(cameraImage, for: .normal)
        cameraButton.tintColor = .black
        view.addSubview(cameraButton)
        
        // 프로필 이미지
        let profileImageView = UIImageView()
        profileImageView.image = UIImage(named: "profileImage") // 실제 프로젝트 이미지에 맞게 설정
        profileImageView.layer.cornerRadius = 40 // 원형으로 만들기 위한 반지름 설정
        profileImageView.layer.masksToBounds = true // 원형 적용
        view.addSubview(profileImageView)
        
        // 유저 이름
        let userNameLabel = UILabel()
        userNameLabel.text = "Jeong_iOS"
        userNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        userNameLabel.textColor = .black
        view.addSubview(userNameLabel)
        
        // 팔로워, 팔로잉 라벨
        let followLabel = UILabel()
        followLabel.text = "팔로워 326  팔로잉 20"
        followLabel.font = UIFont.systemFont(ofSize: 14)
        followLabel.textColor = .black
        view.addSubview(followLabel)
        
        // 프로필 관리 버튼 설정
        let manageProfileButton = UIButton()
        manageProfileButton.setTitle("프로필 관리", for: .normal)
        manageProfileButton.setTitleColor(.black, for: .normal)
        manageProfileButton.layer.borderWidth = 1 // 외곽선 두께 설정
        manageProfileButton.layer.borderColor = UIColor.lightGray.cgColor // 외곽선 색상 설정
        manageProfileButton.layer.cornerRadius = 10 // 모서리 둥글게
        
        // 프로필 공유 버튼 설정
        let shareProfileButton = UIButton()
        shareProfileButton.setTitle("프로필 공유", for: .normal)
        shareProfileButton.setTitleColor(.black, for: .normal)
        shareProfileButton.layer.borderWidth = 1 // 외곽선 두께 설정
        shareProfileButton.layer.borderColor = UIColor.lightGray.cgColor // 외곽선 색상 설정
        shareProfileButton.layer.cornerRadius = 10 // 모서리 둥글게
        
        // 버튼을 뷰에 추가
        view.addSubview(manageProfileButton)
        view.addSubview(shareProfileButton)
        
        // SnapKit을 사용하여 각 UI 요소의 위치 제약 설정
        
        // 설정 아이콘 위치 설정
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(32.5)
            make.width.height.equalTo(24)
        }
        
        // 카메라 아이콘 위치 설정
        cameraButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-32.5)
            make.width.height.equalTo(24)
        }
        
        // 프로필 이미지 위치 설정
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(settingsButton.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(50) // 프로필 이미지 왼쪽 정렬
            make.width.height.equalTo(80) // 원형으로 만들기 위한 크기
        }
        
        // 유저 이름 및 팔로워/팔로잉 텍스트 수직 스택으로 정렬
        let textStackView = UIStackView(arrangedSubviews: [userNameLabel, followLabel])
        textStackView.axis = .vertical
        textStackView.alignment = .leading
        textStackView.spacing = 5
        view.addSubview(textStackView)

        // 유저 이름 및 팔로워/팔로잉 라벨 위치 설정
        textStackView.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView) // 프로필 이미지와 수평 중앙 정렬
            make.leading.equalTo(profileImageView.snp.trailing).offset(20) // 프로필 이미지 오른쪽에 위치
        }
        
        // 프로필 관리 버튼 위치 설정
        manageProfileButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(30)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
        
        // 프로필 공유 버튼 위치 설정
        shareProfileButton.snp.makeConstraints { make in
            make.top.equalTo(manageProfileButton.snp.top)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
        
        // 버튼들 간 간격 및 중앙 정렬
        manageProfileButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.centerX).offset(-7)
        }
        
        shareProfileButton.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.centerX).offset(7)
        }
    }
}

