//
//  profileManageView.swift
//  Kream
//
//  Created by KoNangYeon on 10/7/24.
//

import UIKit

import Then

class profileModifyView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var backBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        $0.tintColor = UIColor.black
        $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 27, bottom: 0, right: 0)
    }//back버튼
    
    public lazy var profileManageTitle = UILabel().then {
        $0.text = "프로필 관리"
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
        $0.textColor = UIColor.black
    }
    
    public lazy var profileImage = UIImageView().then {
        $0.image = UIImage(named: "프로필 Image")
    }
    
    public lazy var profileInformation = UILabel().then {
        $0.text = "프로필 정보"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        $0.textColor = UIColor.black
    }
    
    public lazy var userId = UILabel().then {
        $0.text = "유저 이메일"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = UIColor.black
    }
    
    public lazy var userPwd = UILabel().then {
        $0.text = "유저 비밀번호"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = UIColor.black
    }
    
    public lazy var userIdInput = UITextField().then {
        $0.text = "example@naver.com"
        
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.attributedPlaceholder = NSAttributedString(string: "새로운 이메일을 입력해주세요!", attributes: [.foregroundColor: UIColor(hue: 0, saturation: 0, brightness: 0.75, alpha: 1.0).cgColor, .font: UIFont.systemFont(ofSize: 12, weight: .regular)])//텍스트필드에 다른텍스트 없을 때
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        
        $0.layer.borderColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 83/100, alpha: 1.0).cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 15
        
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    public lazy var userPwdInput = UITextField().then {
        $0.text = "******************"
        
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.attributedPlaceholder = NSAttributedString(string: "새로운 비밀번호를 입력해주세요!", attributes: [.foregroundColor: UIColor(hue: 0, saturation: 0, brightness: 0.75, alpha: 1.0).cgColor, .font: UIFont.systemFont(ofSize: 12, weight: .regular)])//텍스트필드에 다른텍스트 없을 때
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        
        $0.layer.borderColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 83/100, alpha: 1.0).cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 15
        
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var changeBtnTitle: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        container.foregroundColor = UIColor.black
        
        return container
    }()
    
    public lazy var changeBtn1 = UIButton().then {
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 6
        $0.layer.borderColor = UIColor.black.cgColor
        
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("변경", attributes: changeBtnTitle)
        $0.configuration = config
    }
    
    public lazy var changeBtn2 = UIButton().then {
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 6
        $0.layer.borderColor = UIColor.black.cgColor
        
        var config = UIButton.Configuration.plain()
        
        config.attributedTitle = AttributedString("변경", attributes: changeBtnTitle)
        
        $0.configuration = config
    }
    
    private func addComponents(){
        self.addSubview(backBtn)
        self.addSubview(profileManageTitle)
        self.addSubview(profileImage)
        self.addSubview(profileInformation)
        self.addSubview(userId)
        self.addSubview(userIdInput)
        self.addSubview(changeBtn1)
        self.addSubview(userPwd)
        self.addSubview(userPwdInput)
        self.addSubview(changeBtn2)
        
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
        }
        
        changeBtn2.snp.makeConstraints{
            $0.top.equalTo(userPwd.snp.bottom).offset(4)
            $0.right.equalToSuperview().inset(17)
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
