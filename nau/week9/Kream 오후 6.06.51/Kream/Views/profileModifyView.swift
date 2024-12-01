//
//  profileManageView.swift
//  Kream
//
//  Created by KoNangYeon on 10/7/24.
//

import UIKit
import Then
import SnapKit
    
class CustomTextField: UITextField, TextFieldConfig {
    func configTextField(placeholder: String?, leftView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0)), leftViewMode: UITextField.ViewMode = .always , interaction: Bool? = false) {
        self.placeholder = placeholder
        self.leftView = leftView
        self.leftViewMode = leftViewMode
        self.isUserInteractionEnabled = interaction!
    }
    
    func configLabel(text: String?, size: CGFloat = 14, weight: UIFont.Weight = .regular, color: UIColor = .black) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.textColor = color
    }
    
    func configLayer(layerBorderWidth: CGFloat? = 1, layerCornerRadius: CGFloat? = 15, layerColor: UIColor? = UIColor(hexCode: "D5D5D5")) {
        self.layer.borderWidth = layerBorderWidth!
        self.layer.cornerRadius = layerCornerRadius!
        self.layer.borderColor = layerColor?.cgColor
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
    
    public lazy var profileManageTitle = Label(title: "프로필 관리", size: 16, weight: .medium)
    
    //마이뷰 프로필사진 가져오기
    public lazy var profileImage = MYView().profileImage
    
    public lazy var profileInformation = Label(title: "프로필 정보", size: 18, weight: .semibold)
        
    public lazy var userId = Label(title: "유저 이메일", size: 14, weight: .regular)
    
    public lazy var userPwd = Label(title: "유저 비밀번호", size: 14, weight: .regular)
    
    public lazy var userIdInput = CustomTextField().then {
        if let id = LoginModel().loadId() {
            $0.configLabel(text: id)
        }
        $0.configLayer()
        $0.configTextField(placeholder: "새로운 이메일을 입력해주세요!")
    }
    
    public lazy var userPwdInput = CustomTextField().then {
        if let pwd = LoginModel().loadId() {
            $0.configLabel(text: pwd)
        }
        $0.isSecureTextEntry = true
        $0.configLayer()
        $0.configTextField(placeholder: "새로운 비밀번호를 입력해주세요!")
    }
  
    public lazy var changeBtn1 = CustomButton2().then {
        $0.configLabel(text: "변경", size: 14, weight: .regular, color: .black)
        $0.configLayer(layerBorderWidth: 1, layerCornerRadius: 6, layerColor: .black)
    }
    
    public lazy var changeBtn2 = CustomButton2().then {
        $0.configLabel(text: "변경", size: 14, weight: .regular, color: .black)
        $0.configLayer(layerBorderWidth: 1, layerCornerRadius: 6, layerColor: .black)
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
