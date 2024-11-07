//
//  LoginView.swift
//  KreamClone
//
//  Created by 이현주 on 10/2/24.
//

import UIKit
import SnapKit

class LoginView: UIView, UITextFieldDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponenets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var logoImage: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "logo")
        i.contentMode = .scaleAspectFit // 적절한 컨텐츠 모드 설정
        i.translatesAutoresizingMaskIntoConstraints = false

        return i
    }()
    
    public lazy var emailLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 12, weight: .light)
        l.textColor = .black
        l.text = "이메일 주소"
        l.textAlignment = .left
        
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    public lazy var emailTextField: UITextField = {
        let t = UITextField()
        t.tintColor = UIColor(hue: 0, saturation: 0, brightness: 0.63, alpha: 1.0)
        t.attributedPlaceholder = NSAttributedString(string: "예) kream@kream.co.kr", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hue: 0, saturation: 0, brightness: 0.75, alpha: 1.0), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        t.layer.cornerRadius = 15
        t.layer.masksToBounds = true
        t.layer.borderWidth = 1
        t.layer.borderColor = UIColor(hue: 0, saturation: 0, brightness: 0.63, alpha: 1.0).cgColor
        t.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        t.leftViewMode = .always
        t.returnKeyType = .done
        t.keyboardType = UIKeyboardType.emailAddress
        t.textContentType = .emailAddress
        t.clearButtonMode = .whileEditing
        
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    public lazy var emailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        stackView.axis = .vertical // 수직으로 배치
        stackView.spacing = 8 // 레이블과 텍스트필드 사이 간격
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public lazy var pwdLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 12, weight: .light)
        l.textColor = .black
        l.text = "비밀번호"
        l.textAlignment = .left
        
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    public lazy var pwdTextField: UITextField = {
        let t = UITextField()
        t.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hue: 0, saturation: 0, brightness: 0.75, alpha: 1.0), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        t.layer.cornerRadius = 15
        t.layer.masksToBounds = true
        t.layer.borderWidth = 1
        t.layer.borderColor = UIColor(hue: 0, saturation: 0, brightness: 0.63, alpha: 1.0).cgColor
        t.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        t.leftViewMode = .always
        t.returnKeyType = .done
        t.textContentType = .password
        t.isSecureTextEntry = true
        t.clearButtonMode = .whileEditing
        
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    public lazy var pwdStackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [pwdLabel, pwdTextField])
        s.axis = .vertical // 수직으로 배치
        s.spacing = 8 // 레이블과 텍스트필드 사이 간격
        s.alignment = .fill
        s.distribution = .fill
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    public lazy var loginButton: UIButton = {
        let b = UIButton(type: .system)
        b.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.85, alpha: 1.0)
        b.setTitleColor(.white, for: .normal)
        b.setTitle("로그인", for: .normal)
        b.titleLabel?.textAlignment = .center
        b.layer.cornerRadius = 8
        b.layer.masksToBounds = true
        return b
    }()
    
    public lazy var loginStackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [emailStackView, pwdStackView, loginButton])
        s.axis = .vertical // 수직으로 배치
        s.spacing = 17 // 레이블과 텍스트필드 사이 간격
        s.alignment = .fill
        s.distribution = .fill
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    public lazy var kakaoLogin: UIButton = {
        let b = UIButton()
        var configuration = UIButton.Configuration.plain()
        // 이미지 설정
        configuration.image = UIImage(named: "kakao")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        configuration.imagePlacement = .leading
        configuration.imagePadding = 69

        // 타이틀 속성 설정
        let attributes: AttributeContainer = AttributeContainer([
            .font: UIFont.systemFont(ofSize: 13, weight: .bold), .foregroundColor: UIColor.black])
        configuration.attributedTitle = AttributedString("카카오로 로그인", attributes: attributes)
        configuration.titleAlignment = .center
        
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 69) // 여백 설정

        // 버튼 설정
        b.configuration = configuration
        b.layer.cornerRadius = 10
        b.layer.masksToBounds = true
        b.layer.borderWidth = 1
        b.layer.borderColor = UIColor(hue: 0, saturation: 0, brightness: 0.82, alpha: 1.0).cgColor

        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()

    
    public lazy var appleLogin: UIButton = {
        let b = UIButton()
        var configuration = UIButton.Configuration.plain()
        // 이미지 설정
        configuration.image = UIImage(named: "apple")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        configuration.imagePlacement = .leading
        configuration.imagePadding = 69

        // 타이틀 속성 설정
        let attributes: AttributeContainer = AttributeContainer([
            .font: UIFont.systemFont(ofSize: 13, weight: .bold), .foregroundColor: UIColor.black])
        configuration.attributedTitle = AttributedString("Apple로 로그인", attributes: attributes)
        configuration.titleAlignment = .center
        
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 69) // 여백 설정

        // 버튼 설정
        b.configuration = configuration
        b.layer.cornerRadius = 10
        b.layer.masksToBounds = true
        b.layer.borderWidth = 1
        b.layer.borderColor = UIColor(hue: 0, saturation: 0, brightness: 0.82, alpha: 1.0).cgColor

        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    public lazy var socialLoginStackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [kakaoLogin, appleLogin])
        s.axis = .vertical // 수직으로 배치
        s.spacing = 22
        s.alignment = .fill
        s.distribution = .fill
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
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
        addSubview(logoImage)
        addSubview(loginStackView)
        addSubview(socialLoginStackView)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 126),
            logoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 53),
            logoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -53),
            
            loginStackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 87),
            loginStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            loginStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            
            // emailTextField 높이 설정
            emailTextField.heightAnchor.constraint(equalToConstant: 34),
            
            // pwdTextField 높이 설정
            pwdTextField.heightAnchor.constraint(equalToConstant: 34),
            
            // loginButton 높이 설정
            loginButton.heightAnchor.constraint(equalToConstant: 38),
            
            socialLoginStackView.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 87),
            socialLoginStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 47.5),
            socialLoginStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -47.5),
            
            // 카카오 버튼 높이 설정
            kakaoLogin.heightAnchor.constraint(equalToConstant: 40),
            
            // 애플 버튼 높이 설정
            appleLogin.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
