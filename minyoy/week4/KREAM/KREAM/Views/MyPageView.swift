
import UIKit

import SnapKit
import Then

class MyPageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    private func addComponents() {
        self.addSubview(settingImage)
        self.addSubview(cameraImage)
        self.addSubview(profileImage)
        self.addSubview(nameTitleLabel)
        self.addSubview(followerLabel)
        self.addSubview(followingLabel)
        self.addSubview(profileManagerButton)
        self.addSubview(profileShareButton)
        
        settingImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.leading.equalToSuperview().offset(32)
        }
        
        cameraImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.trailing.equalToSuperview().offset(-32)
        }
        
        profileImage.snp.makeConstraints {
            $0.top.equalTo(settingImage.snp.bottom).offset(26)
            $0.leading.equalTo(settingImage.snp.leading)
        }
        
        nameTitleLabel.snp.makeConstraints {
            $0.top.equalTo(settingImage.snp.bottom).offset(47)
            $0.leading.equalTo(profileImage.snp.trailing).offset(16)
        }
        
        followerLabel.snp.makeConstraints {
            $0.top.equalTo(nameTitleLabel.snp.bottom).offset(6)
            $0.leading.equalTo(nameTitleLabel.snp.leading)
        }
        
        followingLabel.snp.makeConstraints {
            $0.top.equalTo(followerLabel.snp.top)
            $0.leading.equalTo(followerLabel.snp.trailing).offset(8)
        }
        
        profileManagerButton.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(26)
            $0.leading.equalTo(settingImage.snp.leading)
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }
        
        profileShareButton.snp.makeConstraints {
            $0.top.equalTo(profileManagerButton.snp.top)
            $0.leading.equalTo(profileManagerButton.snp.trailing).offset(14)
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var settingImage = UIImageView().then {
        $0.image = UIImage(named: "icon_setting")
    }
    
    public lazy var cameraImage = UIImageView().then {
        $0.image = UIImage(named: "icon_camera")
    }
    
    public lazy var profileImage = UIImageView().then {
        $0.image = UIImage(named: "profile")
    }
    
    public lazy var nameTitleLabel = UILabel().then {
        $0.text = "Jeong_iOS"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor.black
        $0.textAlignment = .left
    }
    
    public lazy var followerLabel = UILabel().then {
        $0.text = "팔로워 326"
        $0.font = UIFont.boldSystemFont(ofSize: 12)
        $0.textColor = UIColor.black
        $0.textAlignment = .left
    }
    
    
    public lazy var followingLabel = UILabel().then {
        $0.text = "팔로잉 20"
        $0.font = UIFont.boldSystemFont(ofSize: 12)
        $0.textColor = UIColor.black
        $0.textAlignment = .left
    }
    
    private lazy var profileButtonTitleContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 9)
        container.foregroundColor = UIColor.black
        return container
    }()
    
    public lazy var profileManagerButton = UIButton().then {
        var configuration = UIButton.Configuration.plain()
        
        configuration.attributedTitle = AttributedString("프로필 관리", attributes: profileButtonTitleContainer)
        configuration.titleAlignment = .center
        
        configuration.background.strokeColor = UIColor.systemGray4
        configuration.background.strokeWidth = 0.8
        
        $0.configuration = configuration
    }
    
    public lazy var profileShareButton = UIButton().then {
        var configuration = UIButton.Configuration.plain()
        
        configuration.attributedTitle = AttributedString("프로필 공유", attributes: profileButtonTitleContainer)
        configuration.titleAlignment = .center
        
        configuration.background.strokeColor = UIColor.systemGray4
        configuration.background.strokeWidth = 0.8
        
        $0.configuration = configuration
    }
}
