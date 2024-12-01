//
//  LoginView.swift
//  Kream
//
//  Created by KoNangYeon on 9/30/24.
//

import UIKit

class LoginView: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents(){
        self.addSubview(loginImageView)
        self.addSubview(idLable)
        self.addSubview(pwdLable)
        self.addSubview(idInput)
        self.addSubview(pwdInput)
        self.addSubview(loginButton)
        self.addSubview(loginKakaoButton)
        self.addSubview(loginAppleButton)
        
        NSLayoutConstraint.activate([
            loginImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 126),
            loginImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 53),
            
            idLable.topAnchor.constraint(equalTo: loginImageView.bottomAnchor, constant: 87),
            idLable.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            
            pwdLable.topAnchor.constraint(equalTo: idInput.bottomAnchor, constant: 17),
            pwdLable.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            
            idInput.topAnchor.constraint(equalTo: idLable.bottomAnchor, constant: 8),
            idInput.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            idInput.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            idInput.heightAnchor.constraint(equalToConstant: 34),
            
            pwdInput.topAnchor.constraint(equalTo: pwdLable.bottomAnchor, constant: 8),
            pwdInput.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            pwdInput.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pwdInput.heightAnchor.constraint(equalToConstant: 34),
            
            loginButton.topAnchor.constraint(equalTo: pwdInput.bottomAnchor, constant: 17),
            loginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 38),
            
            loginKakaoButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 87),
            loginKakaoButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 47.5),
            loginKakaoButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginKakaoButton.heightAnchor.constraint(equalToConstant: 40),
            
            loginAppleButton.topAnchor.constraint(equalTo: loginKakaoButton.bottomAnchor, constant: 22),
            loginAppleButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 47.5),
            loginAppleButton.heightAnchor.constraint(equalToConstant: 40),
            loginAppleButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
    }
    
    public lazy var loginImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "크림 로고"))
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()//대문짝만한 크림 이미지..
    
    public lazy var idLable: UILabel = {
        let label = UILabel()
        
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.black
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()//이메일 주소
    
    public lazy var pwdLable: UILabel = {
        let label = UILabel()
        
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.black
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()//비밀번호
    
    public lazy var idInput: UITextField = {
        let text = UITextField()
        
        text.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        text.attributedPlaceholder = NSAttributedString(string: "예) kream@kream.co.kr", attributes: [.foregroundColor: UIColor(hue: 0, saturation: 0, brightness: 0.75, alpha: 1.0).cgColor, .font: UIFont.systemFont(ofSize: 12, weight: .regular)])//텍스트필드에 다른텍스트 없을 때
        text.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        text.leftViewMode = .always
        
        text.layer.borderColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 63/100, alpha: 1.0).cgColor
        text.layer.borderWidth = 1
        text.layer.cornerRadius = 15
        
        text.translatesAutoresizingMaskIntoConstraints = false
    
        return text
    }()//아이디 쓰는 칸
    
    
    public lazy var pwdInput: UITextField = {
        let text = UITextField()
        
        text.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        text.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: [.foregroundColor: UIColor(hue: 0, saturation: 0, brightness: 0.75, alpha: 1.0).cgColor, .font: UIFont.systemFont(ofSize: 12, weight: .regular)])
        
        text.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        text.leftViewMode = .always
        
        text.layer.borderColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 63/100, alpha: 1.0).cgColor
        text.layer.borderWidth = 1
        text.layer.cornerRadius = 15
        text.isSecureTextEntry = true
            
        text.translatesAutoresizingMaskIntoConstraints = false
                
        return text
    }()//비번 쓰는 칸
    
    private lazy var loginTitle: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        container.foregroundColor = UIColor.white
        return container
    }()
    
    public lazy var loginButton: UIButton = {
        let btn = UIButton()
        
        var config = UIButton.Configuration.plain()
        
        config.background.image = UIImage(named: "Rectangle 4")?.withRenderingMode(.alwaysOriginal)
        
        config.attributedTitle = AttributedString("로그인", attributes: loginTitle)
        config.titleAlignment = .center
        
        btn.configuration = config
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()//로그인 버튼 텍스트
    
    private lazy var loginKakaoTitle: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        container.foregroundColor = UIColor.black
        
        return container
    }()
    
    public lazy var loginKakaoButton: UIButton = {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: "Path"), for: .normal)
        
        var config = UIButton.Configuration.plain()
        
        config.background.image = UIImage(named: "Rectangle 5")?.withRenderingMode(.alwaysOriginal)
        
        config.attributedTitle = AttributedString("카카오로 로그인", attributes: loginKakaoTitle)
        
        config.imagePadding = 69
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -84, bottom: 0, trailing: 0)
        
        btn.configuration = config
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()//카카오로 로그인 버튼
    
    private lazy var loginAppleTitle: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        container.foregroundColor = UIColor.black
        return container
    }()
    
    public lazy var loginAppleButton: UIButton = {
        let btn = UIButton()
        
        var config = UIButton.Configuration.plain()
        
        btn.setImage(UIImage(named: "Vector-3"), for: .normal)
        
        config.background.image = UIImage(named: "Rectangle 5")?.withRenderingMode(.alwaysOriginal)
        
        config.attributedTitle = AttributedString("Apple로 로그인", attributes: loginKakaoTitle)
        
        config.imagePadding = 69
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -84.17, bottom: 0, trailing: 0)
            
        btn.configuration = config
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()//Apple로 로그인 버튼
    
}
