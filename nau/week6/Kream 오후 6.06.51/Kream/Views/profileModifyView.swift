//
//  profileManageView.swift
//  Kream
//
//  Created by KoNangYeon on 10/7/24.
//

import UIKit
import Then
import SnapKit

class BasicButton : UIButton, BtnConfig {
    func config(title: String?, image: UIImage?) {
        self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)
    }
}

class CustomButton2 : UIButton, BtnConfig {
    func config(title: String?, image: UIImage?) {
        self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 6
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitleColor(UIColor.black, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomLabel : UILabel, LabelConfig {
    func config(text: String?, size: CGFloat, weight: UIFont.Weight, color: UIColor) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.textColor = color
    }
}
    
class CustomTextField: UITextField, TextFieldConfig {
    func config(placeholder: String?) {
        self.placeholder = placeholder
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        self.leftViewMode = .always
        self.layer.borderColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 83/100, alpha: 1.0).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class profileModifyView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var backBtn = BasicButton().then {
        $0.config(title: nil, image: UIImage(systemName: "arrow.backward"))
        $0.tintColor = .black
    }
    
    public lazy var profileManageTitle = CustomLabel().then {
        $0.config(text: "프로필 관리", size: 16, weight: .medium, color: .black)
    }
    
    //마이뷰 프로필사진 가져오기
    public lazy var profileImage = MYView().profileImage
    
    public lazy var profileInformation = CustomLabel().then {
        $0.config(text: "프로필 정보", size: 18, weight: .semibold, color: .black)
    }
    public lazy var userId = CustomLabel().then {
        $0.config(text: "유저 이메일", size: 14, weight: .regular, color: .black)
    }
    public lazy var userPwd = CustomLabel().then {
        $0.config(text: "유저 비밀번호", size: 14, weight: .regular, color: .black)
    }
    
    public lazy var userIdInput = CustomTextField().then {
        if let id = LoginModel().loadId() {
            $0.text = id
        }
        $0.config(placeholder: "새로운 이메일을 입력해주세요!")
        
    }

    public lazy var userPwdInput = CustomTextField().then {
        //"******************"
        if let pwd = LoginModel().loadPwd() {
            $0.text = pwd
        }
        $0.config(placeholder: "새로운 비밀번호를 입력해주세요!")
    }
    
    public lazy var changeBtn1 = CustomButton2().then {
        $0.config(title: "변경", image: nil)
    }
    
    public lazy var changeBtn2 = CustomButton2().then {
        $0.config(title: "변경", image: nil)
    }
    
    private func addComponents(){
        [
            backBtn,
            profileManageTitle,
            profileImage,
            profileInformation,
            userId,
            userIdInput,
            changeBtn1,
            userPwd,
            userPwdInput,
            changeBtn2
        ].forEach{
            addSubview($0)
        }
        
        backBtn.snp.makeConstraints{
            $0.top.equalToSuperview().inset(67)
            $0.left.equalToSuperview().inset(27)
        }
        
        profileManageTitle.snp.makeConstraints{
            $0.top.equalToSuperview().inset(66)
            $0.left.equalToSuperview().inset(164)
        }
        
        profileImage.snp.makeConstraints{
            $0.top.equalTo(profileManageTitle.snp.bottom).offset(52)
            $0.centerX.equalToSuperview()
        }
        profileInformation.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.bottom).offset(20)
            $0.left.equalToSuperview().inset(27)
        }
        userId.snp.makeConstraints{
            $0.top.equalTo(profileInformation.snp.bottom).offset(23)
            $0.left.equalToSuperview().inset(27)
        }
        userIdInput.snp.makeConstraints{
            $0.top.equalTo(userId.snp.bottom).offset(4)
            $0.right.equalTo(changeBtn1.snp.left).offset(-9)
            $0.left.equalToSuperview().inset(27)
            $0.height.equalTo(32)
        }
        changeBtn1.snp.makeConstraints{
            $0.top.equalTo(userId.snp.bottom).offset(4)
            $0.right.equalToSuperview().inset(17)
            $0.width.equalTo(58)
        }
        
        changeBtn2.snp.makeConstraints{
            $0.top.equalTo(userPwd.snp.bottom).offset(4)
            $0.right.equalToSuperview().inset(17)
            $0.width.equalTo(58)
        }
        
        userPwd.snp.makeConstraints{
            $0.top.equalTo(userIdInput.snp.bottom).offset(23)
            $0.left.equalToSuperview().inset(27)
        }
        userPwdInput.snp.makeConstraints{
            $0.top.equalTo(userPwd.snp.bottom).offset(4)
            $0.right.equalTo(changeBtn2.snp.left).offset(-9)
            $0.left.equalToSuperview().inset(27)
            $0.height.equalTo(32)
        }
    }
}
