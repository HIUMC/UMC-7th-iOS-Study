//
//  LoginView.swift
//  KREAM
//
//  Created by 주민영 on 10/1/24.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    private func addComponents() {
        self.addSubview(logoImage)
        self.addSubview(idLabel)
        self.addSubview(idTextField)
        self.addSubview(pwdLabel)
        self.addSubview(pwdTextField)
        self.addSubview(localLoginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
        
        NSLayoutConstraint.activate([
            logoImage.widthAnchor.constraint(equalToConstant: 287),
            logoImage.heightAnchor.constraint(equalToConstant: 75),
            logoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 126),
            logoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            idLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 87),
            idLabel.leftAnchor.constraint(equalTo: idTextField.leftAnchor),
            
            idTextField.widthAnchor.constraint(equalToConstant: 303),
            idTextField.heightAnchor.constraint(equalToConstant: 34),
            idTextField.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 8),
            idTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            pwdLabel.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 17),
            pwdLabel.leftAnchor.constraint(equalTo: idTextField.leftAnchor),
            
            pwdTextField.widthAnchor.constraint(equalToConstant: 303),
            pwdTextField.heightAnchor.constraint(equalToConstant: 34),
            pwdTextField.topAnchor.constraint(equalTo: pwdLabel.bottomAnchor, constant: 8),
            pwdTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            localLoginButton.widthAnchor.constraint(equalToConstant: 303),
            localLoginButton.heightAnchor.constraint(equalToConstant: 38),
            localLoginButton.topAnchor.constraint(equalTo: pwdTextField.bottomAnchor, constant: 17),
            localLoginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            kakaoLoginButton.widthAnchor.constraint(equalToConstant: 298),
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: 40),
            kakaoLoginButton.topAnchor.constraint(equalTo: localLoginButton.bottomAnchor, constant: 87),
            kakaoLoginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            appleLoginButton.widthAnchor.constraint(equalToConstant: 298),
            appleLoginButton.heightAnchor.constraint(equalToConstant: 40),
            appleLoginButton.topAnchor.constraint(equalTo: kakaoLoginButton.bottomAnchor, constant: 22),
            appleLoginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var logoImage: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "KREAM_logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    public lazy var idLabel: UILabel = {
        let label = UILabel()
        
        label.text = "이메일 주소"
        
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public lazy var idTextField: UITextField = {
        let textField = UITextField()
        
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textColor = UIColor.black
        textField.textAlignment = .left
        
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        
        textField.placeholder = "예) kream@kream.co.kr"
        textField.autocapitalizationType = .none
        
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        textField.leftViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    public lazy var pwdLabel: UILabel = {
        let label = UILabel()
        
        label.text = "비밀번호"
        
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public lazy var pwdTextField: UITextField = {
        let textField = UITextField()
        
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textColor = UIColor.black
        textField.textAlignment = .left
        
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.autocapitalizationType = .none
        
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        textField.leftViewMode = .always
        
        textField.isSecureTextEntry = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var localLoginTitleContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 14)
        container.foregroundColor = UIColor.white
        return container
    }()
    
    public lazy var localLoginButton: UIButton = {
        let btn = UIButton()
        
        var configuration = UIButton.Configuration.filled()
        
        configuration.baseBackgroundColor = UIColor.systemGray4
        
        configuration.attributedTitle = AttributedString("로그인", attributes: localLoginTitleContainer)
        configuration.titleAlignment = .center
        
        btn.configuration = configuration
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    private lazy var socialLoginTitleContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        container.foregroundColor = UIColor.black
        return container
    }()
    
    public lazy var kakaoLoginButton: UIButton = {
        let btn = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        
        configuration.image = UIImage(systemName: "message.fill", withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 10)))?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -90, bottom: 0, trailing: 0)
        configuration.imagePadding = 69
        
        configuration.attributedTitle = AttributedString("카카오로 로그인", attributes: socialLoginTitleContainer)
        configuration.titleAlignment = .leading
        
        configuration.background.strokeColor = UIColor.systemGray4
        configuration.background.strokeWidth = 1
        
        btn.configuration = configuration
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    public lazy var appleLoginButton: UIButton = {
        let btn = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        
        configuration.image = UIImage(systemName: "apple.logo")?
            .withConfiguration(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 13)))
            .withRenderingMode(.alwaysOriginal)
            .withTintColor(.black)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -90, bottom: 0, trailing: 0)
        configuration.imagePadding = 69
        
        configuration.attributedTitle = AttributedString("Apple로 로그인", attributes: socialLoginTitleContainer)
        
        configuration.background.strokeColor = UIColor.systemGray4
        configuration.background.strokeWidth = 1
        
        btn.configuration = configuration
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
}
