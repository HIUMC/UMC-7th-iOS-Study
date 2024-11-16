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
    
    private lazy var setButton = BasicButton().then {
        $0.config(title: nil, image: UIImage(named: "환경 설정 버튼"))
    }
    //설정버튼
    
    private lazy var cameraButton = BasicButton().then {
        $0.config(title: nil, image: UIImage(named: "Vector-4"))
    }
    //카메라버튼
    
    public lazy var profileImage = UIImageView().then {
        $0.image = UIImage(named: "IMG_0477.JPG")
        $0.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        $0.layer.cornerRadius = $0.frame.height/2
        $0.clipsToBounds = true
    }
    
    private lazy var ProfileNicName = Label(title: "Nau_iOS", size: 16, weight: .medium)
    
    lazy var profileManageButton = CustomButton2().then {
        $0.configLabel(text: "프로필 관리", size: 9, weight: .regular, color: .black)
        $0.configLayer(layerBorderWidth: 0.8, layerCornerRadius: 8, layerColor: UIColor(hue: 0/360, saturation: 0/100, brightness: 83/100, alpha: 1.0))
    }
    
    lazy var profileShareButton = CustomButton2().then {
        $0.configLabel(text: "프로필 공유", size: 9, weight: .regular, color: .black)
        $0.configLayer(layerBorderWidth: 0.8, layerCornerRadius: 8, layerColor: UIColor(hue: 0/360, saturation: 0/100, brightness: 83/100, alpha: 1.0))
    }
    
    private lazy var follower = Label(title: "팔로워", size: 12, weight: .regular)
    
    private lazy var following = Label(title: "팔로잉", size: 12, weight: .regular)
    
    private lazy var followerCount = Label(title: " 326", size: 12, weight: .semibold)
    
    private lazy var followingCount = Label(title: " 326", size: 12, weight: .semibold)
    
    private func addComponents(){
        [
            setButton,
            cameraButton,
            profileImage,
            ProfileNicName,
            follower,
            followerCount,
            following,
            followingCount,
            profileManageButton,
            profileShareButton
        ].forEach{
            addSubview($0)
        }
        
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
        
        followerCount.snp.makeConstraints{
            $0.top.equalTo(ProfileNicName.snp.bottom).offset(6)
            $0.left.equalTo(follower.snp.right)
        }
        
        following.snp.makeConstraints{
            $0.top.equalTo(ProfileNicName.snp.bottom).offset(6)
            $0.left.equalTo(followerCount.snp.right).offset(8)
        }
        
        followingCount.snp.makeConstraints{
            $0.top.equalTo(ProfileNicName.snp.bottom).offset(6)
            $0.left.equalTo(following.snp.right)
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
