//
//  MYView.swift
//  Kream
//
//  Created by KoNangYeon on 10/6/24.
//

import UIKit
import SnapKit
import Then

protocol BtnConfig {
    func config(title: String?, image: UIImage?)
}

protocol LabelConfig {
    func config(text: String?, size: CGFloat, weight: UIFont.Weight, color: UIColor)
}

protocol TextFieldConfig {
    func config(placeholder: String?)
}

class ProfileImageView: UIImageView {
    init(imageName: String) {
        super.init(frame: .zero)
        self.image = UIImage(named: imageName)
        self.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Label: UILabel {
    init(title: String, size: CGFloat, weight: UIFont.Weight, color: UIColor){
        super.init(frame: .zero)
        self.text = title
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.textColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomButton1: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        self.layer.borderWidth = 0.8
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 83/100, alpha: 1.0).cgColor
        
        var config = UIButton.Configuration.plain()
        
        config.attributedTitle = AttributedString(title, attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 9, weight: .regular),
            .foregroundColor: UIColor.black]))

        self.configuration = config
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

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
    
    public lazy var profileImage = ProfileImageView(imageName: "IMG_0477.JPG")
    
    private lazy var ProfileNicName = Label(title: "Nau_iOS", size: 16, weight: .medium, color: .black)
    
    public lazy var profileManageButton = CustomButton1(title: "프로필 관리")
    
    public lazy var profileShareButton = CustomButton1(title: "프로필 공유")
    
    private lazy var follower = Label(title: "팔로워", size: 12, weight: .regular, color: .black)
    
    private lazy var following = Label(title: "팔로잉", size: 12, weight: .regular, color: .black)
    
    private lazy var followerCount = Label(title: " 326", size: 12, weight: .semibold, color: .black)
    
    private lazy var followingCount = Label(title: " 326", size: 12, weight: .semibold, color: .black)
    
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
