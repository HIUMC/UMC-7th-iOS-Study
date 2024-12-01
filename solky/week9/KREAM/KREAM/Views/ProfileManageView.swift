//
//  ProfileManageView.swift
//  KREAM
//
//  Created by 이태림 on 10/8/24.
//

import UIKit

import SnapKit

import Then

class ProfileManageView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //프로필 사진
    public lazy var profilemanageImage: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    //프로필 정보
    public lazy var profileinformationLabel = UILabel().then {
        $0.text = "프로필 정보"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    //유저 이메일
    public lazy var useremailLabel = UILabel().then {
        $0.text = "유저 이메일"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.textAlignment = .left
    }
    
    //유저 이메일 텍스트 필드
    public lazy var useremailtextfield = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "example@naver.com", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)])
        $0.layer.borderColor = UIColor(red: 0.84, green: 0.84, blue: 0.84, alpha: 1.00).cgColor
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 0))
        $0.leftViewMode = .always
        $0.isUserInteractionEnabled = false
        
    }
    
    //변경 버튼
    public lazy var emailchangebutton = UIButton().then {
        
        $0.setTitle("변경", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.layer.cornerRadius = 6
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
    }
    
    //유저 비밀번호
    public lazy var userpasswordLabel = UILabel().then {
        $0.text = "유저 비밀번호"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.textAlignment = .left
    }
    
    //유저 비밀번호 텍스트 필드
    public lazy var userpasswordtextfield = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "******************", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)])

        
        $0.layer.borderColor = UIColor(red: 0.84, green: 0.84, blue: 0.84, alpha: 1.00).cgColor
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.isSecureTextEntry = true
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 0))
        $0.leftViewMode = .always
        $0.isUserInteractionEnabled = false
    }
    
    //변경 버튼
    public lazy var passwordchangebutton = UIButton().then {
        
        $0.setTitle("변경", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.layer.cornerRadius = 6
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
    }
    
    private func addComponents() {
        self.addSubview(profilemanageImage)
        self.addSubview(profileinformationLabel)
        self.addSubview(useremailLabel)
        self.addSubview(useremailtextfield)
        self.addSubview(emailchangebutton)
        self.addSubview(userpasswordLabel)
        self.addSubview(userpasswordtextfield)
        self.addSubview(passwordchangebutton)
        
        profilemanageImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(144)
            $0.leading.equalToSuperview().offset(151)
            $0.width.equalTo(90)
        }
        
        profileinformationLabel.snp.makeConstraints {
            $0.top.equalTo(profilemanageImage.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(27)
        }
        
        useremailLabel.snp.makeConstraints {
            $0.top.equalTo(profileinformationLabel.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(27)
        }
        
        useremailtextfield.snp.makeConstraints {
            $0.top.equalTo(useremailLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(27)
            $0.trailing.equalToSuperview().inset(84)
            $0.height.equalTo(32)
        }
        
        emailchangebutton.snp.makeConstraints {
            $0.top.equalTo(useremailLabel.snp.bottom).offset(4)
            $0.leading.equalTo(useremailtextfield.snp.trailing).offset(9)
            $0.trailing.equalToSuperview().inset(17)
            $0.height.equalTo(32)
        }
        
        userpasswordLabel.snp.makeConstraints{
            $0.top.equalTo(useremailtextfield.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(27)
        }
        
        userpasswordtextfield.snp.makeConstraints{
            $0.top.equalTo(userpasswordLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(27)
            $0.trailing.equalToSuperview().inset(84)
            $0.height.equalTo(32)
        }
        
        passwordchangebutton.snp.makeConstraints{
            $0.top.equalTo(userpasswordLabel.snp.bottom).offset(4)
            $0.leading.equalTo(userpasswordtextfield.snp.trailing).offset(9)
            $0.trailing.equalToSuperview().inset(17)
            $0.height.equalTo(32)
        }
    }
}
