//
//  ManageProfileView.swift
//  cloneKream
//
//  Created by 김서현 on 10/3/24.
//

import UIKit
import SnapKit

class ManageProfileView: UIView {

    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        if let image = UIImage(named: "userProfile") {
            imageView.image = image
        }
        imageView.layer.cornerRadius = 45
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 이메일"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor(red: 213/255, green: 213/255, blue: 213/255, alpha: 1).cgColor
        textField.layer.borderWidth = 1
        textField.addLeftPadding()
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "example@gmail.com",
            attributes: [
                .font: UIFont.systemFont(ofSize: 12), // 폰트 크기 설정
                .foregroundColor: UIColor.black
                //.foregroundColor: UIColor(red: 193/255, green: 193/255, blue: 193/255, alpha: 1) // placeholder 색상 설정
            ]
        )
        return textField
    }()
    
    let emailChangeButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    private lazy var emailStack1: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, emailChangeButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var emailStack2: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailLabel, emailStack1])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        return stackView
    }()
    
    private let pwdLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 비밀번호"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let pwdTextField: UITextField = {
        let textField = UITextField()
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor(red: 213/255, green: 213/255, blue: 213/255, alpha: 1).cgColor
        textField.layer.borderWidth = 1
        textField.addLeftPadding()
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "****************",
            attributes: [
                .font: UIFont.systemFont(ofSize: 12), // 폰트 크기 설정
                .foregroundColor: UIColor.black
                //.foregroundColor: UIColor(red: 193/255, green: 193/255, blue: 193/255, alpha: 1) // placeholder 색상 설정
            ]
        )
        return textField
    }()
    
    let pwdChangeButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    private lazy var pwdStack1: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwdTextField, pwdChangeButton])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var pwdStack2: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwdLabel, pwdStack1])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        return stackView
    }()
    

    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImage)
        addSubview(profileLabel)
        addSubview(emailStack2)
        addSubview(pwdStack2)
        backgroundColor = .white
        
        setConstraints()
        

        
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        profileImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(70)
            $0.width.height.equalTo(90)
        }
        
        profileLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(22)
            $0.top.equalTo(profileImage.snp.bottom).offset(30)
        }
        
        emailStack2.snp.makeConstraints {
            $0.top.equalTo(profileLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(22)
        }
        
        pwdStack2.snp.makeConstraints {
            $0.top.equalTo(emailStack2.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(22)
        }
        
        emailStack1.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.trailing.equalToSuperview()
        }
        
        emailTextField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        emailChangeButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        emailTextField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        emailChangeButton.snp.makeConstraints {
            $0.width.equalTo(58)
        }
        
        pwdStack1.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.trailing.equalToSuperview()
        }
        
        pwdTextField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        pwdChangeButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        pwdTextField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        pwdChangeButton.snp.makeConstraints {
            $0.width.equalTo(58)
        }
        
        
    }
    
    
    func changeTextField() {
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "새로운 이메일을 입력해주세요!",
            attributes: [
                .font: UIFont.systemFont(ofSize: 12), // 폰트 크기 설정
                .foregroundColor: UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1) // placeholder 색상 설정
            ]
        )
        
        pwdTextField.attributedPlaceholder = NSAttributedString(
            string: "새로운 비밀번호를 입력해주세요!",
            attributes: [
                .font: UIFont.systemFont(ofSize: 12), // 폰트 크기 설정
                .foregroundColor: UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1) // placeholder 색상 설정
            ]
        )
        
        emailChangeButton.setTitle("확인", for: .normal)
        pwdChangeButton.setTitle("확인", for: .normal)

    }
    
    
    func saveTextField() {
        
        emailChangeButton.setTitle("변경", for: .normal)
        pwdChangeButton.setTitle("변경", for: .normal)
    }



}
