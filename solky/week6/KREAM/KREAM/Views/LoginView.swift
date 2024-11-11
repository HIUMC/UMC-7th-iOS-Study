//
//  LoginView.swift
//  KREAM
//
//  Created by 이태림 on 10/3/24.
//

import UIKit
import SnapKit
import Then

class LoginView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // 크림 이미지
    public lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit // 이미지 비율 유지

        return image
    }()
    
    // 이메일 주소 입력
    public lazy var idLabel = UILabel().then {
        $0.text = "이메일 주소"
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .black
    }
    
    // 이메일 입력 텍스트 필드
    public lazy var idTextField = UITextField().then {
        $0.placeholder = "예) kream@kream.co.kr"
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.borderStyle = .roundedRect
        $0.autocapitalizationType = .none
        $0.keyboardType = .emailAddress
    }
    
    // 비밀번호 라벨
    public lazy var pwdLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .black
    }
        
    // 비밀번호 입력 텍스트 필드
    public lazy var pwdTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.borderStyle = .roundedRect
        $0.isSecureTextEntry = true
    }
    
    // 로그인 버튼
    public lazy var loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
        $0.layer.cornerRadius = 8
    }
    
    // 버튼 내부 텍스트 폰트 지정 컨테이너
    private lazy var titleContainer: AttributeContainer = {
            var container = AttributeContainer()
            container.font = UIFont.systemFont(ofSize: 13, weight: .bold)
            container.foregroundColor = UIColor.black
        
            return container
    }()
    
    //카카오 로그인 버튼
    public lazy var kakaologinButton = UIButton().then {
        var configuration = UIButton.Configuration.plain()
        
        let IconConfig = UIImage.SymbolConfiguration(pointSize: 10)
        configuration.image = UIImage(systemName: "message.fill", withConfiguration: IconConfig)?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        configuration.imagePlacement = .leading
        configuration.imagePadding = 69
        
        configuration.attributedTitle = AttributedString("카카오로 로그인", attributes: titleContainer)
        configuration.titleAlignment = .center
        
        $0.configuration = configuration
        $0.contentHorizontalAlignment = .leading
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    //애플 로그인 버튼
    public lazy var appleloginButton = UIButton().then {
        
        var configuration = UIButton.Configuration.plain()
        
        let IconConfig = UIImage.SymbolConfiguration(pointSize: 13)
        configuration.image = UIImage(systemName: "apple.logo", withConfiguration: IconConfig)?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        configuration.imagePlacement = .leading
        configuration.imagePadding = 69
        
        configuration.attributedTitle = AttributedString("Apple로 로그인", attributes: titleContainer)
        configuration.titleAlignment = .center
        
        $0.configuration = configuration
        $0.contentHorizontalAlignment = .leading
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setViews() {
        self.addSubview(imageView)
        self.addSubview(idLabel)
        self.addSubview(idTextField)
        self.addSubview(pwdLabel)
        self.addSubview(pwdTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaologinButton)
        self.addSubview(appleloginButton)
        
        imageView.image = UIImage(named: "kream")
    }
    
    private func setConstraints() {
       
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(126)
            $0.leading.equalToSuperview().offset(53)
            $0.trailing.equalToSuperview().offset(-53)
            $0.width.equalTo(287)
            $0.height.equalTo(75)
        }
            
        idLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(87)
            $0.leading.equalToSuperview().offset(45)
            $0.trailing.equalToSuperview().offset(-45)
        }
    
        idTextField.snp.makeConstraints {
            $0.top.equalTo(idLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(45)
            $0.trailing.equalToSuperview().offset(-45)
            $0.height.equalTo(34)
        }
        
        pwdLabel.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(17)
            $0.leading.equalToSuperview().offset(45)
            $0.trailing.equalToSuperview().offset(-45)
        }
        
        pwdTextField.snp.makeConstraints {
            $0.top.equalTo(pwdLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(45)
            $0.trailing.equalToSuperview().offset(-45)
            $0.height.equalTo(34)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwdTextField.snp.bottom).offset(17)
            $0.leading.equalToSuperview().offset(45)
            $0.trailing.equalToSuperview().offset(-45)
            $0.height.equalTo(38)
        }
        
        kakaologinButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(87)
            $0.leading.equalToSuperview().offset(47.5)
            $0.trailing.equalToSuperview().offset(-47.5)
            $0.height.equalTo(40)
        }
            
        appleloginButton.snp.makeConstraints {
            $0.top.equalTo(kakaologinButton.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(47.5)
            $0.trailing.equalToSuperview().offset(-47.5)
            $0.height.equalTo(40)
        }
    }
    
}
