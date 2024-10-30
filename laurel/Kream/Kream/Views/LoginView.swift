////
//  LoginView.swift
//  Kream
//
//  Created by 어진 on 10/3/24.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    // MyPageViewController로 이동하는 액션 클로저
    var onLoginButtonTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    
        // 크림 로고
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        if let image = UIImage(named: "kreamlogo") {
            imageView.image = image
        }
        addSubview(imageView)
        
        // 이메일 주소
        let idLabel: UILabel = {
            let label = UILabel()
            label.text = "이메일 주소"
            label.font = UIFont.systemFont(ofSize: 11)
            return label
        }()
        addSubview(idLabel)
        
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
        addSubview(idTextField)
        
        // 비밀번호
        let passwordLabel: UILabel = {
            let label = UILabel()
            label.text = "비밀번호"
            label.font = UIFont.systemFont(ofSize: 11)
            return label
        }()
        addSubview(passwordLabel)
        
        // 비밀번호 입력 칸
        let passwordTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "      비밀번호를 입력해주세요"
            textField.isSecureTextEntry = true
            textField.layer.cornerRadius = 15
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.font = UIFont.systemFont(ofSize: 11)
            return textField
        }()
        addSubview(passwordTextField)
        
        // 로그인 버튼
        let loginButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("로그인", for: .normal)
            button.backgroundColor = .lightGray
            button.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 10
            button.addTarget(self, action: #selector(handleLoginButtonTapped), for: .touchUpInside)
            return button
        }()
        addSubview(loginButton)
        
        // 카카오 로그인 버튼
        let kakaoLoginButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle(" 카카오로 로그인", for: .normal)
            if let kakaoImage = UIImage(named: "kakaologo")?.withRenderingMode(.alwaysOriginal) {
                button.setImage(kakaoImage, for: .normal)
            }
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.cornerRadius = 10
            
            return button
        }()
        addSubview(kakaoLoginButton)
        
        // Apple 로그인 버튼
        let appleLoginButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle(" Apple로 로그인", for: .normal)
            if let appleImage = UIImage(named: "applelogo")?.withRenderingMode(.alwaysOriginal) {
                button.setImage(appleImage, for: .normal)
            }
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.cornerRadius = 10
            return button
        }()
        addSubview(appleLoginButton)
        
        // SnapKit으로 레이아웃 설정
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide).offset(126)
            make.width.equalTo(287)
            make.height.equalTo(75)
        }
        
        idLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalTo(idTextField)
            make.top.equalTo(imageView.snp.bottom).offset(40)
        }
        
        idTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(idLabel.snp.bottom).offset(5)
            make.width.equalTo(300)
            make.height.equalTo(35)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalTo(idTextField)
            make.top.equalTo(idTextField.snp.bottom).offset(15)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordLabel.snp.bottom).offset(10)
            make.width.equalTo(300)
            make.height.equalTo(35)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        
        kakaoLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(90)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        
        appleLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(kakaoLoginButton.snp.bottom).offset(20)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleLoginButtonTapped() {
        onLoginButtonTapped?()
    }
}
