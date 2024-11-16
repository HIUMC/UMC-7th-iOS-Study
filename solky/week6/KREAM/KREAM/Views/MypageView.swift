//
//  MypageView.swift
//  KREAM
//
//  Created by 이태림 on 10/8/24.
//

import UIKit

import SnapKit

import Then

class MypageView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //환경 설정 이미지
    public lazy var settingImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    //카메라 이미지
    public lazy var cameraImage: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    //프로필 사진
    public lazy var profileImage: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    //닉네임
    public lazy var nicknameLabel = UILabel().then {
        $0.text = "Jeong_iOS"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
    }
    
    //팔로워
    public lazy var followerLabel = UILabel().then {
        let attributedString = NSMutableAttributedString(string: "팔로워 326")
        let stringLength = attributedString.length
        
        attributedString.addAttributes([.foregroundColor: UIColor.black,
                                        .font: UIFont.systemFont(ofSize: 12, weight: .medium)], range: NSRange(location: 0, length: 3))
        attributedString.addAttributes([.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 12, weight: .bold)], range: NSRange(location: 4, length: stringLength - 4))
        $0.attributedText = attributedString
    }
    
    //팔로잉
    public lazy var followingLabel = UILabel().then {
        let attributedString = NSMutableAttributedString(string: "팔로잉 20")
        let stringLength = attributedString.length
        
        attributedString.addAttributes([.foregroundColor: UIColor.black,
                                        .font: UIFont.systemFont(ofSize: 12, weight: .medium)], range: NSRange(location: 0, length: 3))
        attributedString.addAttributes([.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 12, weight: .bold)], range: NSRange(location: 4, length: stringLength - 4))
        $0.attributedText = attributedString
    }
        
    //프로필 관리 버튼
    public lazy var profilemanageButton = UIButton().then {
        $0.setTitle("프로필 관리", for: .normal)
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 0.8
        $0.layer.borderColor = UIColor(red: 0.84, green: 0.84, blue: 0.84, alpha: 1.00).cgColor
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .medium)
    }
    
    //프로필 공유 버튼
    public lazy var profileshareButton = UIButton().then {
        $0.setTitle("프로필 공유", for: .normal)
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 0.8
        $0.layer.borderColor = UIColor(red: 0.84, green: 0.84, blue: 0.84, alpha: 1.00).cgColor
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .medium)
    }
    
    //상단,하단 프레임 구분
    public lazy var separateView = UIView().then {
            $0.backgroundColor = UIColor(red: 0.84, green: 0.84, blue: 0.84, alpha: 1.00)
        }
    
    private func setViews() {
        
        self.addSubview(settingImage)
        self.addSubview(cameraImage)
        self.addSubview(profileImage)
        self.addSubview(nicknameLabel)
        self.addSubview(followerLabel)
        self.addSubview(followingLabel)
        self.addSubview(profilemanageButton)
        self.addSubview(profileshareButton)
        self.addSubview(separateView)
        
        settingImage.image = UIImage(named: "setting")
        cameraImage.image = UIImage(named: "camera")
        profileImage.image = UIImage(named: "profile")
    }
    
    private func setConstraints() {
        
        settingImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.leading.equalToSuperview().offset(32.5)
        }
        
        cameraImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.leading.equalTo(settingImage.snp.trailing).offset(277)
        }
        
        profileImage.snp.makeConstraints {
            $0.top.equalTo(settingImage.snp.bottom).offset(26)
            $0.leading.equalToSuperview().offset(32.5)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(settingImage.snp.bottom).offset(47)
            $0.leading.equalTo(profileImage.snp.trailing).offset(16)
        }
        
        followerLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(profileImage.snp.trailing).offset(16)
        }
        
        followingLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(followerLabel.snp.trailing).offset(8)
        }
        
        profilemanageButton.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.bottom).offset(26)
            $0.leading.equalToSuperview().offset(32.5)
            $0.trailing.equalToSuperview().inset(203.5)
        }
        
        profileshareButton.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.bottom).offset(26)
            $0.leading.equalTo(profilemanageButton.snp.trailing).offset(14)
            $0.trailing.equalToSuperview().inset(32.5)
        }
        
        separateView.snp.makeConstraints{
            $0.top.equalTo(profilemanageButton.snp.bottom).offset(29)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(separateView.snp.top).inset(24)
        }
    }
}
