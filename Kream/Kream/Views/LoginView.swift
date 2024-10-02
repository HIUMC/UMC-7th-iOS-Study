//
//  LoginView.swift
//  Kream
//
//  Created by 어진 on 10/3/24.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    
        //크림 로고
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        if let image = UIImage(named: "kreamlogo") {
            imageView.image = image
        }
        addSubview(imageView)
        
        //이메일 주소
        let idLabel: UILabel = {
            let label = UILabel()
            label.text = "이메일 주소"
            label.font = UIFont.systemFont(ofSize: 11)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        // 이메일 입력 칸
        let idTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "      예) kream@kream.co.kr"
            textField.layer.cornerRadius = 15
            textField.clipsToBounds = true
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.font = UIFont.systemFont(ofSize: 11)
            return textField
        }()
        
        // 비밀번호
        let passwordLabel: UILabel = {
            let label = UILabel()
            label.text = "비밀번호"
            label.font = UIFont.systemFont(ofSize: 11)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        // 비밀번호 입력 칸
        let passwordTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "      비밀번호를 입력해주세요"
            textField.isSecureTextEntry = true
            textField.clipsToBounds = true
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.layer.cornerRadius = 15
            textField.font = UIFont.systemFont(ofSize: 11)

            return textField
        }()
        
        // 로그인 버튼
        let loginButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("로그인", for: .normal)
            button.backgroundColor = .lightGray
            button.setTitleColor(.white, for: .normal) // 버튼 텍스트 색상 설정
            button.layer.cornerRadius = 10 // 버튼 모서리 둥글게
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        // 카카오 로그인 버튼
        let kakaoLoginButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("카카오로 로그인", for: .normal)
            if let kakaoImage = UIImage(named: "kakaologo")?.withRenderingMode(.alwaysOriginal) {                   button.setImage(kakaoImage, for: .normal)
               }
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.cornerRadius = 10
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -150, bottom: 0, right: 0)
     
            return button
        }()
        
        
        
        //apple로 로그인
        
        let appleLoginButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Apple로 로그인", for: .normal)
            if let appleImage = UIImage(named: "applelogo")?.withRenderingMode(.alwaysOriginal) {                   button.setImage(appleImage, for: .normal)
               }
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.cornerRadius = 10
            button.translatesAutoresizingMaskIntoConstraints = false
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -150, bottom: 0, right: 0)
            return button
        }()
        
        
        // 요소 추가
        addSubview(idLabel)
        addSubview(idTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(kakaoLoginButton)
        addSubview(appleLoginButton)
        
        
        // Auto Layout 설정
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        // 레이아웃 설정
        NSLayoutConstraint.activate([
            // 이미지
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 126),
            imageView.widthAnchor.constraint(equalToConstant: 287),
            imageView.heightAnchor.constraint(equalToConstant: 75),
            
            // 이메일 입력 라벨
            idLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            idLabel.leadingAnchor.constraint(equalTo: idTextField.leadingAnchor),
            idLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            
            // 아이디 입력 필드
            idTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            idTextField.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 5),
            idTextField.widthAnchor.constraint(equalToConstant: 300),
            idTextField.heightAnchor.constraint(equalToConstant: 35),
            
            // 비밀번호 입력 라벨
            passwordLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordLabel.leadingAnchor.constraint(equalTo: idTextField.leadingAnchor),
            passwordLabel.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 15),
            passwordLabel.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 30),
            
            // 비밀번호 입력 필드
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 35),
            
            // 로그인 버튼
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),

            loginButton.widthAnchor.constraint(equalToConstant: 300),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            //카카오 로그인
            kakaoLoginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
               kakaoLoginButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 80),
               kakaoLoginButton.widthAnchor.constraint(equalToConstant: 300),
               kakaoLoginButton.heightAnchor.constraint(equalToConstant: 40) ,
            
            //apple 로그인
            appleLoginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            appleLoginButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 140),
            appleLoginButton.widthAnchor.constraint(equalToConstant: 300),
            appleLoginButton.heightAnchor.constraint(equalToConstant: 40)
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


