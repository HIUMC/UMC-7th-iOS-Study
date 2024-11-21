//
//  LoginView.swift
//  cloneKream
//
//  Created by 김서현 on 10/2/24.
//

import UIKit
import SnapKit

class LoginView: UIView {

    private let logoImage:  UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private let pwdLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 15
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1).cgColor
        textField.layer.borderWidth = 1
        textField.addLeftPadding()
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "예) kream@kream.co.kr",
            attributes: [
                .font: UIFont.systemFont(ofSize: 12), // 폰트 크기 설정
                .foregroundColor: UIColor(red: 193/255, green: 193/255, blue: 193/255, alpha: 1) // placeholder 색상 설정
            ]
        )
        textField.snp.makeConstraints {
            $0.height.equalTo(34)
        }
        return textField
    }()
    
    private let pwdTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 15
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1).cgColor
        textField.layer.borderWidth = 1
        textField.addLeftPadding()
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호를 입력해주세요",
            attributes: [
                .font: UIFont.systemFont(ofSize: 12), // 폰트 크기 설정
                .foregroundColor: UIColor(red: 193/255, green: 193/255, blue: 193/255, alpha: 1) // placeholder 색상 설정
            ]
        )
        
        textField.snp.makeConstraints {
            $0.height.equalTo(34)
        }
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        
        button.snp.makeConstraints {
            $0.height.equalTo(38)
        }
        
        
        return button
    }()
    
    public lazy var kakaoLoginButton: UIButton = {
        let button = UIButton()
        
        let label = UILabel()
        label.text = "카카오로 로그인"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.addSubview(label)
        
        let imageView = UIImageView()
        if let image = UIImage(named: "kakaoIcon") {
            imageView.image = image
        }
        imageView.contentMode = .scaleAspectFit
        button.addSubview(imageView)
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        imageView.snp.makeConstraints({
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(15)
            $0.height.equalTo(14)
        })
        
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1).cgColor
        button.layer.masksToBounds = true
        return button
    }()
    
    private let appleLoginButton: UIButton = {
        let button = UIButton()
        let label = UILabel()
        label.text = "애플로 로그인"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.addSubview(label)
        
        let imageView = UIImageView()
        if let image = UIImage(named: "appleIcon") {
            imageView.image = image
        }
        imageView.contentMode = .scaleAspectFit
        button.addSubview(imageView)
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        imageView.snp.makeConstraints({
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(15.17)
            $0.height.equalTo(18)
        })
        
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1).cgColor
        button.layer.masksToBounds = true
        return button
    }()
    
    
    private lazy var emailStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        
        stackView.snp.makeConstraints {
            $0.height.equalTo(57)
        }
        return stackView
    }()
    
    private lazy var pwdStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwdLabel, pwdTextField])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        
        stackView.snp.makeConstraints {
            $0.height.equalTo(57)
        }
        return stackView
    }()
    
    private lazy var userInfoStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailStack, pwdStack, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 17
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var loginStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [kakaoLoginButton, appleLoginButton])
        stackView.axis = .vertical
        stackView.spacing = 22
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setUpConstraints()
        addAction()
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .white
        addSubview(logoImage)
        addSubview(userInfoStack)
        addSubview(loginStack)
    }
    
    private func setUpConstraints() {
        logoImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
            $0.width.equalTo(287)
            $0.height.equalTo(75)
        }
        
        userInfoStack.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(303)
            $0.height.equalTo(186)
        }
        
        loginStack.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(100)
            $0.width.equalTo(298)
            $0.height.equalTo(102)
        }
    }
    
    // closure: 함수 chunk
    var buttonAction: (() -> Void)?
    
    @objc private func buttonTapped() {
        LoginModel.shared.userId = emailTextField.text ?? "example@gmail.com"
        LoginModel.shared.saveUserInfo(pwdTextField.text ?? "*********")
        
        buttonAction?() // 함수로서 클로저 실행
        
    }
    
    func addAction() {
        loginButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

}



