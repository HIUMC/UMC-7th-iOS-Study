//
//  LoginView.swift
//  MyKream
//
//  Created by 김호성 on 2024.09.24.
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
    
    private func addComponents() {
        self.addSubview(ivTitle)
        self.addSubview(lbEmail)
        self.addSubview(tfEmail)
        self.addSubview(lbPassword)
        self.addSubview(tfPassword)
        self.addSubview(btnLogin)
        self.addSubview(btnKakaoLogin)
        self.addSubview(btnAppleLogin)
        
        NSLayoutConstraint.activate([
            ivTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 126),
            ivTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 53),
            ivTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -53),
            ivTitle.heightAnchor.constraint(equalToConstant: 75),
            
            lbEmail.topAnchor.constraint(equalTo: ivTitle.bottomAnchor, constant: 87),
            lbEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            
            tfEmail.topAnchor.constraint(equalTo: lbEmail.bottomAnchor, constant: 8),
            tfEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            tfEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            tfEmail.heightAnchor.constraint(equalToConstant: 34),
            
            lbPassword.topAnchor.constraint(equalTo: tfEmail.bottomAnchor, constant: 17),
            lbPassword.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            
            tfPassword.topAnchor.constraint(equalTo: lbPassword.bottomAnchor, constant: 8),
            tfPassword.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            tfPassword.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            tfPassword.heightAnchor.constraint(equalToConstant: 34),
            
            btnLogin.topAnchor.constraint(equalTo: tfPassword.bottomAnchor, constant: 17),
            btnLogin.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            btnLogin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            btnLogin.heightAnchor.constraint(equalToConstant: 38),
            
            btnKakaoLogin.topAnchor.constraint(equalTo: btnLogin.bottomAnchor, constant: 87),
            btnKakaoLogin.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 47.5),
            btnKakaoLogin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -47.5),
            btnKakaoLogin.heightAnchor.constraint(equalToConstant: 40),
            
            btnAppleLogin.topAnchor.constraint(equalTo: btnKakaoLogin.bottomAnchor, constant: 22),
            btnAppleLogin.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 47.5),
            btnAppleLogin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -47.5),
            btnAppleLogin.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    public lazy var ivTitle: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "title.png")
        
        return imageView
    }()
    
    private lazy var lbEmail: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }()
    
    public lazy var tfEmail: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "예) kream@kream.co.kr", attributes: [.foregroundColor: UIColor(red: 193/255, green: 193/255, blue: 193/255, alpha: 1)])
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1).cgColor
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.delegate = self
        
        return textField
    }()
    
    private lazy var lbPassword: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }()
    
    public lazy var tfPassword: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: [.foregroundColor: UIColor(red: 193/255, green: 193/255, blue: 193/255, alpha: 1)])
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1).cgColor
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.delegate = self
        
        return textField
    }()
    
    private lazy var titleContainer: AttributeContainer = {
        var container = AttributeContainer()
        
        container.font = UIFont.systemFont(ofSize: 14)
        container.foregroundColor = UIColor.white
        
        return container
    }()
    
    public lazy var btnLogin: UIButton = {
        let button = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        configuration.background.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        configuration.attributedTitle = AttributedString("로그인", attributes: titleContainer)
        configuration.titleAlignment = .center
        
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    private lazy var socialTitleContainer: AttributeContainer = {
        var container = AttributeContainer()
        
        container.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        container.foregroundColor = UIColor.black
        
        return container
    }()
    
    public lazy var btnKakaoLogin: UIButton = {
        let button = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 17, bottom: 0, trailing: 0)
        configuration.image = UIImage(named: "kakao")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        configuration.imagePlacement = .leading
        configuration.imagePadding = 69
        configuration.background.backgroundColor = UIColor.white
        configuration.attributedTitle = AttributedString("카카오로 로그인", attributes: socialTitleContainer)
        configuration.titleAlignment = .center
        
        button.configuration = configuration
        button.contentHorizontalAlignment = .leading
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1).cgColor
        
        return button
    }()
    
    public lazy var btnAppleLogin: UIButton = {
        let button = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 17, bottom: 0, trailing: 0)
        configuration.image = UIImage(named: "apple")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        configuration.imagePlacement = .leading
        configuration.imagePadding = 69
        configuration.background.backgroundColor = UIColor.white
        configuration.attributedTitle = AttributedString("Apple로 로그인", attributes: socialTitleContainer)
        configuration.titleAlignment = .center
        
        button.configuration = configuration
        button.contentHorizontalAlignment = .leading
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1).cgColor
        
        return button
    }()
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case tfEmail:
            tfPassword.becomeFirstResponder()
        case tfPassword:
            tfPassword.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
