//
//  ProfileManageView.swift
//  KreamClone
//
//  Created by 이현주 on 10/7/24.
//

import UIKit

class ProfileManageView: UIView, UITextFieldDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponenets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var profileImg: UIImageView = {
        let i = UIImageView()
        //i.image = UIImage(named: "profile")
        i.layer.cornerRadius = 45
        i.layer.masksToBounds = true
        i.contentMode = .scaleAspectFill
        return i
    }()
    
    public lazy var profileInfo: UILabel = {
        let l = UILabel()
        l.text = "프로필 정보"
        l.textColor = .black
        l.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return l
    }()
    
    public lazy var emailLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        l.textColor = .black
        l.text = "유저 이메일"
        l.textAlignment = .left
        return l
    }()
    
    public lazy var emailTextField: UITextField = {
        let t = UITextField()
        t.tintColor = UIColor(hue: 0, saturation: 0, brightness: 0.63, alpha: 1.0)
        t.attributedPlaceholder = NSAttributedString(string: "새로운 이메일을 입력해 주세요!", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "#A2A2A2") ?? .lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)])
        t.layer.cornerRadius = 10
        t.layer.masksToBounds = true
        t.layer.borderWidth = 1
        t.layer.borderColor = UIColor(hex: "#D5D5D5")?.cgColor
        t.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 11.0, height: 0.0))
        t.leftViewMode = .always
        t.returnKeyType = .done
        t.textContentType = .emailAddress
        t.keyboardType = UIKeyboardType.emailAddress
        t.clearButtonMode = .whileEditing
        return t
    }()
    
    public lazy var emailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        stackView.axis = .vertical // 수직으로 배치
        stackView.spacing = 4 // 레이블과 텍스트필드 사이 간격
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    public lazy var emailCheckBtn: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("변경", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.layer.cornerRadius = 6
        b.layer.borderWidth = 1
        b.layer.borderColor = UIColor.black.cgColor
        return b
    }()
    
    public lazy var pwdLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        l.textColor = .black
        l.text = "유저 비밀번호"
        l.textAlignment = .left
        return l
    }()
    
    public lazy var pwdTextField: UITextField = {
        let t = UITextField()
        t.tintColor = UIColor(hue: 0, saturation: 0, brightness: 0.63, alpha: 1.0)
        t.attributedPlaceholder = NSAttributedString(string: "새로운 비밀번호을 입력해 주세요!", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "#A2A2A2") ?? .lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)])
        t.layer.cornerRadius = 10
        t.layer.masksToBounds = true
        t.layer.borderWidth = 1
        t.layer.borderColor = UIColor(hex: "#D5D5D5")?.cgColor
        t.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 11.0, height: 0.0))
        t.leftViewMode = .always
        t.returnKeyType = .done
        t.textContentType = .password
        t.isSecureTextEntry = true
        t.clearButtonMode = .whileEditing
        return t
    }()
    
    public lazy var pwdStackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [pwdLabel, pwdTextField])
        s.axis = .vertical // 수직으로 배치
        s.spacing = 4 // 레이블과 텍스트필드 사이 간격
        s.alignment = .fill
        s.distribution = .fill
        return s
    }()
    
    public lazy var pwdCheckBtn: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("변경", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.layer.cornerRadius = 6
        b.layer.borderWidth = 1
        b.layer.borderColor = UIColor.black.cgColor
        return b
    }()
    
    // 배경 클릭시 키보드 내림  ==> view 에 터치가 들어오면 에디팅모드를 끝냄.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)  //firstresponder가 전부 사라짐
    }
    
    // done 버튼 누를 때 다음 텍스트 필드로 이동
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.emailTextField {
            self.pwdTextField.becomeFirstResponder()
        } else if textField == self.pwdTextField {
            self.pwdStackView.resignFirstResponder()
        }
        return true
    }
    
    private func addComponenets() {
        addSubview(profileImg)
        addSubview(profileInfo)
        addSubview(emailStackView)
        addSubview(emailCheckBtn)
        addSubview(pwdStackView)
        addSubview(pwdCheckBtn)
        
        profileImg.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(52)
            $0.centerX.equalTo(safeAreaLayoutGuide)
            $0.width.height.equalTo(90)
        }
        
        profileInfo.snp.makeConstraints {
            $0.top.equalTo(profileImg.snp.bottom).offset(20)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(27)
        }
        
        emailStackView.snp.makeConstraints {
            $0.top.equalTo(profileInfo.snp.bottom).offset(23)
            $0.leading.equalTo(profileInfo.snp.leading)
        }
        
        emailTextField.snp.makeConstraints {
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        emailCheckBtn.snp.makeConstraints {
            $0.leading.equalTo(emailStackView.snp.trailing).offset(9)
            $0.trailing.equalTo(safeAreaLayoutGuide).offset(-17)
            $0.bottom.equalTo(emailStackView.snp.bottom)
            $0.height.equalTo(32)
        }
        
        pwdStackView.snp.makeConstraints {
            $0.top.equalTo(emailStackView.snp.bottom).offset(23)
            $0.leading.equalTo(emailStackView.snp.leading)
        }
        
        pwdTextField.snp.makeConstraints {
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        pwdCheckBtn.snp.makeConstraints {
            $0.leading.equalTo(pwdStackView.snp.trailing).offset(9)
            $0.trailing.equalTo(safeAreaLayoutGuide).offset(-17)
            $0.bottom.equalTo(pwdStackView.snp.bottom)
            $0.height.equalTo(32)
        }
    }

}
