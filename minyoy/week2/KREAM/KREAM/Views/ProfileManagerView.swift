
import UIKit

import SnapKit
import Then

class ProfileManagerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    private func addComponents() {
        self.addSubview(leftArrowButton)
        self.addSubview(profileManagerTitleLabel)
        self.addSubview(profileImage)
        self.addSubview(profileInfoLabel)
        self.addSubview(userEmailLabel)
        self.addSubview(userEmailTextField)
        self.addSubview(userEmailEditButton)
        self.addSubview(userPasswordLabel)
        self.addSubview(userPasswordTextField)
        self.addSubview(userPasswordEditButton)
        
        leftArrowButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(66)
            $0.trailing.equalTo(profileManagerTitleLabel.snp.leading).offset(-112)
            $0.width.equalTo(25)
            $0.height.equalTo(25)
        }
        
        profileManagerTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(66)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(74)
            $0.height.equalTo(26)
        }
        
        profileImage.snp.makeConstraints {
            $0.top.equalTo(profileManagerTitleLabel.snp.bottom).offset(52)
            $0.centerX.equalToSuperview()
        }
        
        profileInfoLabel.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(27)
        }
        
        userEmailLabel.snp.makeConstraints {
            $0.top.equalTo(profileInfoLabel.snp.bottom).offset(23)
            $0.leading.equalTo(profileInfoLabel.snp.leading)
        }
        
        userEmailTextField.snp.makeConstraints {
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            $0.leading.equalTo(profileInfoLabel.snp.leading)
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        userEmailEditButton.snp.makeConstraints {
            $0.top.equalTo(userEmailTextField.snp.top)
            $0.leading.equalTo(userEmailTextField.snp.trailing).offset(9)
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
        
        userPasswordLabel.snp.makeConstraints {
            $0.top.equalTo(userEmailTextField.snp.bottom).offset(23)
            $0.leading.equalTo(profileInfoLabel.snp.leading)
        }
        
        userPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(userPasswordLabel.snp.bottom).offset(4)
            $0.leading.equalTo(profileInfoLabel.snp.leading)
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        userPasswordEditButton.snp.makeConstraints {
            $0.top.equalTo(userPasswordTextField.snp.top)
            $0.leading.equalTo(userPasswordTextField.snp.trailing).offset(9)
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var leftArrowButton: UIButton = {
        let btn = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        
        configuration.image = UIImage(named: "icon_leftArrow")

        btn.configuration = configuration
        
        return btn
    }()
    
    public lazy var profileManagerTitleLabel = UILabel().then {
        $0.text = "프로필 관리"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    public lazy var profileImage = UIImageView().then {
        $0.image = UIImage(named: "profile")
    }

    public lazy var profileInfoLabel = UILabel().then {
        $0.text = "프로필 정보"
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    public lazy var userEmailLabel = UILabel().then {
        $0.text = "유저 이메일"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    public lazy var userEmailTextField = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .black
        $0.textAlignment = .left
        
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        
        $0.placeholder = "새로운 이메일을 입력해주세요!"
        
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 11.0, height: 0.0))
        $0.leftViewMode = .always
    }
    
    public lazy var userPasswordLabel = UILabel().then {
        $0.text = "유저 비밀번호"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = UIColor.black
        $0.textAlignment = .left
    }
    
    public lazy var userPasswordTextField = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .black
        $0.textAlignment = .left
        
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        
        $0.placeholder = "새로운 비밀번호를 입력해주세요!"
        
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 11.0, height: 0.0))
        $0.leftViewMode = .always
        
        $0.isSecureTextEntry = true
    }
    
    private lazy var EditButtonContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 14)
        container.foregroundColor = UIColor.black
        return container
    }()
    
    public lazy var userEmailEditButton = UIButton().then {
        var configuration = UIButton.Configuration.plain()
        
        configuration.attributedTitle = AttributedString("변경", attributes: EditButtonContainer)
        configuration.titleAlignment = .center
        
        configuration.background.strokeColor = .black
        configuration.background.strokeWidth = 1
        
        $0.configuration = configuration
        
        $0.addTarget(self, action: #selector(userEmailBtnDidTap), for: .touchUpInside)
    }
    
    @objc private func userEmailBtnDidTap() {
        userEmailTextField.do {
            $0.text = ""
        }
        userEmailEditButton.configuration?.attributedTitle = AttributedString("확인", attributes: EditButtonContainer)
    }
    
    public lazy var userPasswordEditButton = UIButton().then {
        var configuration = UIButton.Configuration.plain()
        
        configuration.attributedTitle = AttributedString("변경", attributes: EditButtonContainer)
        configuration.titleAlignment = .center
        
        configuration.background.strokeColor = .black
        configuration.background.strokeWidth = 1
        
        $0.configuration = configuration
        
        $0.addTarget(self, action: #selector(userPasswordBtnDidTap), for: .touchUpInside)
    }
    
    @objc private func userPasswordBtnDidTap() {
        userPasswordTextField.do {
            $0.text = ""
        }
        userPasswordEditButton.configuration?.attributedTitle = AttributedString("확인", attributes: EditButtonContainer)
    }
}
