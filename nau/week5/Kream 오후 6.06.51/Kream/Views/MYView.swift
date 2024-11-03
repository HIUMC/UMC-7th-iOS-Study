//
//  MYView.swift
//  Kream
//
//  Created by KoNangYeon on 10/6/24.
//

import UIKit

import SnapKit

import Then

class MYView: UIView {

    override init(frame: CGRect){
        super.init(frame: CGRect(x: 0, y: 0, width: 393, height: 297))
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var setButton = UIButton().then {
        var config = UIButton.Configuration.plain()

        config.background.image = UIImage(named: "환경 설정 버튼")?.withRenderingMode(.alwaysOriginal)
        $0.configuration = config
    }//설정버튼
    
    public lazy var cameraButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        
        config.background.image = UIImage(named: "Vector-4")?.withRenderingMode(.alwaysOriginal)
        $0.configuration = config
    }//카메라버튼
    
    public lazy var profileImage = UIImageView().then {
        $0.image = UIImage(named: "IMG_0477.JPG")
        $0.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        $0.layer.cornerRadius = $0.frame.height/2
        $0.clipsToBounds = true
    }//프로필사진
    
    public lazy var ProfileNicName = UILabel().then {
        $0.text = "Nau_iOS"
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
        $0.textColor = UIColor.black
    }//닉네임

    public lazy var follower = UILabel().then {
        let text = NSMutableAttributedString()
       
        let a = NSMutableAttributedString(
            string: "팔로워",
            attributes: [
                .font: UIFont.systemFont(ofSize: 12, weight: .regular),
                .foregroundColor: UIColor.black
            ])
        let b = NSMutableAttributedString(
            string: " 326",
            attributes: [
                .font: UIFont.systemFont(ofSize: 12, weight: .semibold),
            .foregroundColor: UIColor.black
        ])
        text.append(a)
        text.append(b)
        
        $0.attributedText = text
    }//팔로워
    
    
    public lazy var following = UILabel().then {
        let text = NSMutableAttributedString()
        
        let a = NSMutableAttributedString(
            string: "팔로잉",
            attributes: [
                .font: UIFont.systemFont(ofSize: 12, weight: .regular),
                .foregroundColor: UIColor.black
            ])
        let b = NSMutableAttributedString(
            string: " 20",
            attributes: [
                .font: UIFont.systemFont(ofSize: 12, weight: .semibold),
            .foregroundColor: UIColor.black
        ])
        text.append(a)
        text.append(b)
        
        $0.attributedText = text
    }//팔로잉
    
    private lazy var profileBtnTitle: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        container.foregroundColor = UIColor.black
        return container
    }()
    
    public lazy var profileManageButton = UIButton().then {
        $0.layer.borderWidth = 0.8
        $0.layer.cornerRadius = 8
        $0.layer.borderColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 83/100, alpha: 1.0).cgColor
        
        var config = UIButton.Configuration.plain()
        
        config.attributedTitle = AttributedString("프로필 관리", attributes: profileBtnTitle)
        
        $0.configuration = config
    }//프로필 관리 버튼
    
    public lazy var profileShareButton = UIButton().then {
        $0.layer.borderWidth = 0.8
        $0.layer.cornerRadius = 8
        $0.layer.borderColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 83/100, alpha: 1.0).cgColor
        
        var config = UIButton.Configuration.plain()
        
        config.attributedTitle = AttributedString("프로필 공유", attributes: profileBtnTitle)
        
        $0.configuration = config
    }
    
    private func addComponents(){
        self.addSubview(setButton)
        self.addSubview(cameraButton)
        self.addSubview(profileImage)
        self.addSubview(ProfileNicName)
        self.addSubview(follower)
        self.addSubview(following)
        self.addSubview(profileManageButton)
        self.addSubview(profileShareButton)
        
        setButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(75)
            $0.left.equalToSuperview().inset(32.5)
            $0.width.equalTo(25)
            $0.height.equalTo(25)
        }
        
        cameraButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(75)
            $0.right.equalToSuperview().inset(32.5)
            $0.width.equalTo(25)
            $0.height.equalTo(25)
        }
        
        profileImage.snp.makeConstraints{
            $0.top.equalTo(setButton.snp.bottom).offset(26)
            $0.left.equalToSuperview().inset(32.5)
            $0.width.equalTo(90)
            $0.height.equalTo(90)
        }
            
            
        ProfileNicName.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.top).offset(21)
            $0.left.equalTo(profileImage.snp.right).offset(16)
        }
            
        follower.snp.makeConstraints{
            $0.top.equalTo(ProfileNicName.snp.bottom).offset(6)
            $0.left.equalTo(profileImage.snp.right).offset(16)
        }
        
        following.snp.makeConstraints{
            $0.top.equalTo(ProfileNicName.snp.bottom).offset(6)
            $0.left.equalTo(follower.snp.right).offset(8)
        }
            
        profileManageButton.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.bottom).offset(26)
            $0.left.equalToSuperview().inset(32.5)
            $0.height.equalTo(28)
            $0.right.equalTo(snp.centerX).offset(-7)
        }
        
        profileShareButton.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.bottom).offset(26)
            $0.right.equalToSuperview().inset(32.5)
            $0.height.equalTo(28)
            $0.left.equalTo(snp.centerX).offset(7)
        }
        
        
        
    }
}
