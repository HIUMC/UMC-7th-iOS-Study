//
//  LoginView.swift
//  KREAM
//
//  Created by 이태림 on 10/3/24.
//

import UIKit

class LoginView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // 크림 이미지
    public lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit // 이미지 비율 유지
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    // 이메일 주소 입력
    public lazy var idLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // 이메일 입력 텍스트 필드
    public lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "예) kream@kream.co.kr"
        textField.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        
        textField.translatesAutoresizingMaskIntoConstraints = false
           
        return textField
    }()
    
    // 비밀번호 라벨
    public lazy var pwdLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
        
    // 비밀번호 입력 텍스트 필드
    public lazy var pwdTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    // 로그인 버튼
    public lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        button.isEnabled = false
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // 버튼 내부 텍스트 폰트 지정 컨테이너
    private lazy var titleContainer: AttributeContainer = {
            var container = AttributeContainer()
            container.font = UIFont.systemFont(ofSize: 13, weight: .bold)
            container.foregroundColor = UIColor.black
        
            return container
    }()
    
    //카카오 로그인 버튼
    public lazy var kakaologinButton: UIButton = {
        let button = UIButton(type: .system)
        
        var configuration = UIButton.Configuration.plain()
        
        let IconConfig = UIImage.SymbolConfiguration(pointSize: 10)
        configuration.image = UIImage(systemName: "message.fill", withConfiguration: IconConfig)?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        configuration.imagePlacement = .leading
        configuration.imagePadding = 69
        
        configuration.attributedTitle = AttributedString("카카오로 로그인", attributes: titleContainer)
        configuration.titleAlignment = .center
        
        button.configuration = configuration
        
        button.contentHorizontalAlignment = .leading
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    //애플 로그인 버튼
    public lazy var appleloginButton: UIButton = {
        let button = UIButton(type: .system)
        
        var configuration = UIButton.Configuration.plain()
        
        let IconConfig = UIImage.SymbolConfiguration(pointSize: 13)
        configuration.image = UIImage(systemName: "apple.logo", withConfiguration: IconConfig)?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        configuration.imagePlacement = .leading
        configuration.imagePadding = 69
        
        configuration.attributedTitle = AttributedString("Apple로 로그인", attributes: titleContainer)
        configuration.titleAlignment = .center
        
        button.configuration = configuration
        
        button.contentHorizontalAlignment = .leading
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private func addComponents() {
        self.addSubview(imageView)
        self.addSubview(idLabel)
        self.addSubview(idTextField)
        self.addSubview(pwdLabel)
        self.addSubview(pwdTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaologinButton)
        self.addSubview(appleloginButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 126),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 53),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -53),
            imageView.widthAnchor.constraint(equalToConstant: 287),
            imageView.heightAnchor.constraint(equalToConstant: 75),
            
            idLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 87),
            idLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            idLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            
            idTextField.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 8),
            idTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            idTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),
            idTextField.heightAnchor.constraint(equalToConstant: 34),
            
            pwdLabel.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 17),
            pwdLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            pwdLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),
            
            pwdTextField.topAnchor.constraint(equalTo: pwdLabel.bottomAnchor, constant: 8),
            pwdTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            pwdTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            pwdTextField.heightAnchor.constraint(equalToConstant: 34),
            
            loginButton.topAnchor.constraint(equalTo: pwdTextField.bottomAnchor, constant: 17),
            loginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            loginButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),
            loginButton.heightAnchor.constraint(equalToConstant: 38),
            
            kakaologinButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 87),
            kakaologinButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 47.5),
            kakaologinButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -47.5),
            kakaologinButton.heightAnchor.constraint(equalToConstant: 40),
            
            appleloginButton.topAnchor.constraint(equalTo: kakaologinButton.bottomAnchor, constant: 22),
            appleloginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 47.5),
            appleloginButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -47.5),
            appleloginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        imageView.image = UIImage(named: "kream")
    }
}
