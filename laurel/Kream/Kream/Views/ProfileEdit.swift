//
//  ProfileEdit.swift
//  Kream
//
//  Created by 어진 on 10/31/24.
//

//
//  ProfileEdit.swift
//  Kream
//
//  Created by 어진 on 10/31/24.
//

import Foundation
import UIKit
import SnapKit

class ProfileEditView: UIView {
    
    let profileImageView = UIImageView()
    let label = UILabel()
    
    private lazy var profileStackView: UIStackView = {
        
        // 이메일 레이블 설정
        let verLabel = UILabel()
        verLabel.text = "유저 이메일"
        verLabel.textColor = .black
        verLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        // 이메일 입력 필드 설정
        let emailTextField = UITextField()
        emailTextField.placeholder = " example@naver.com"
        emailTextField.layer.cornerRadius = 8
        emailTextField.layer.masksToBounds = true
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.font = UIFont.systemFont(ofSize: 14)
        
        // 이메일 입력 필드와 버튼을 담은 스택뷰
        let emailInputStack = UIStackView()
        emailInputStack.axis = .horizontal
        emailInputStack.spacing = 10
        
        // 변경 버튼 설정 (이메일)
        let emailConfirmButton = UIButton(type: .system)
        emailConfirmButton.setTitle("변경", for: .normal)
        emailConfirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        emailConfirmButton.layer.borderWidth = 1
        emailConfirmButton.layer.borderColor = UIColor.black.cgColor
        emailConfirmButton.layer.cornerRadius = 8
        emailConfirmButton.setTitleColor(.black, for: .normal)
        
        emailInputStack.addArrangedSubview(emailTextField)
        emailInputStack.addArrangedSubview(emailConfirmButton)
        
        emailTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        // 비밀번호 레이블 설정
        let extraLabel = UILabel()
        extraLabel.text = "유저 비밀번호"
        extraLabel.textColor = .black
        extraLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        // 비밀번호 입력 필드 설정
        let passwordTextField = UITextField()
        passwordTextField.placeholder = " ******************"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.font = UIFont.systemFont(ofSize: 14)
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        // 비밀번호 입력 필드와 버튼을 담은 스택뷰
        let passwordInputStack = UIStackView()
        passwordInputStack.axis = .horizontal
        passwordInputStack.spacing = 10
        
        // 변경 버튼 설정 (비밀번호)
        let passwordConfirmButton = UIButton(type: .system)
        passwordConfirmButton.setTitle("변경", for: .normal)
        passwordConfirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        passwordConfirmButton.layer.borderWidth = 1
        passwordConfirmButton.layer.borderColor = UIColor.black.cgColor
        passwordConfirmButton.layer.cornerRadius = 8
        passwordConfirmButton.setTitleColor(.black, for: .normal)
        
        // 버튼 클릭 시 텍스트를 변경하는 액션 추가
        passwordConfirmButton.addTarget(self, action: #selector(handlePasswordButtonTapped(_:)), for: .touchUpInside)

        passwordInputStack.addArrangedSubview(passwordTextField)
        passwordInputStack.addArrangedSubview(passwordConfirmButton)

        passwordTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        // 메인 스택뷰에 각 레이블과 인풋 스택뷰를 추가
        let stackView = UIStackView(arrangedSubviews: [verLabel, emailInputStack, extraLabel, passwordInputStack])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // 버튼 클릭 액션 함수
    @objc private func handlePasswordButtonTapped(_ sender: UIButton) {
        if sender.title(for: .normal) == "변경" {
            sender.setTitle("확인", for: .normal)
        } 
    }
    
    private func setupView() {
        self.backgroundColor = .white
        
        // 프로필 이미지 설정
        profileImageView.image = UIImage(named: "profileImage")
        profileImageView.layer.cornerRadius = 50
        profileImageView.layer.masksToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        
        // 레이블 설정
        label.text = "프로필 정보"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .left
        label.textColor = .black
        
        // 메인 스택뷰 설정
        let mainStackView = UIStackView(arrangedSubviews: [label, profileStackView])
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.spacing = 50
        addSubview(mainStackView)
        addSubview(profileImageView)
        
        // 프로필 이미지 제약 조건 설정
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview() // 가운데 정렬
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.width.height.equalTo(90)
        }
        
        // 메인 스택뷰 제약 조건 설정
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}
