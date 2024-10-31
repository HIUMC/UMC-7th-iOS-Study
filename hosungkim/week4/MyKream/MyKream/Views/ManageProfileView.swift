//
//  ManageProfileView.swift
//  MyKream
//
//  Created by 김호성 on 2024.10.07.
//

import UIKit
import SnapKit

class ManageProfileView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        applyComponentStyles()
    }
    private func applyComponentStyles() {
        ivProfile.layer.cornerRadius = ivProfile.frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(navigationBarView)
        navigationBarView.addSubview(btnBack)
        navigationBarView.addSubview(lbTitle)
        
        self.addSubview(ivProfile)
        
        self.addSubview(profileInfoView)
        profileInfoView.addSubview(lbProfileInfo)
        profileInfoView.addSubview(lbEmail)
        profileInfoView.addSubview(tfEmail)
        profileInfoView.addSubview(btnUpdateEmail)
        profileInfoView.addSubview(lbPassword)
        profileInfoView.addSubview(tfPassword)
        profileInfoView.addSubview(btnUpdatePassword)
        
        navigationBarView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalToSuperview().inset(27)
            $0.height.equalTo(26)
        }
        btnBack.snp.makeConstraints {
            $0.top.equalToSuperview().inset(1)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(25)
        }
        lbTitle.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        ivProfile.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(navigationBarView.snp.bottom).offset(52)
            $0.width.height.equalTo(90)
        }
        profileInfoView.snp.makeConstraints {
            $0.top.equalTo(ivProfile.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(27)
            $0.height.equalTo(191)
        }
        lbProfileInfo.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(29)
        }
        lbEmail.snp.makeConstraints {
            $0.top.equalTo(lbProfileInfo.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(22)
        }
        tfEmail.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.top.equalTo(lbEmail.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
        }
        btnUpdateEmail.snp.makeConstraints {
            $0.width.equalTo(58)
            $0.height.equalTo(32)
            $0.top.equalTo(lbEmail.snp.bottom).offset(4)
            $0.leading.equalTo(tfEmail.snp.trailing).offset(9)
            $0.trailing.equalToSuperview()
        }
        lbPassword.snp.makeConstraints {
            $0.top.equalTo(tfEmail.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(22)
        }
        tfPassword.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.top.equalTo(lbPassword.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
        }
        btnUpdatePassword.snp.makeConstraints {
            $0.width.equalTo(58)
            $0.height.equalTo(32)
            $0.top.equalTo(lbPassword.snp.bottom).offset(4)
            $0.leading.equalTo(tfPassword.snp.trailing).offset(9)
            $0.trailing.equalToSuperview()
        }
    }
    
    private lazy var navigationBarView: UIView = {
        let view = UIView()
        
        return view
    }()
    public lazy var btnBack: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "left_arrow"), for: .normal)
        
        return button
    }()
    private lazy var lbTitle: UILabel = {
        let label = UILabel()
        
        label.text = "프로필 관리"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }()
    public lazy var ivProfile: UIImageView = {
        let imageView = UIImageView()
        
//        imageView.image = UIImage(named: "profile.png")
        imageView.clipsToBounds = true
        
        return imageView
    }()
    private lazy var profileInfoView: UIView = {
        let view = UIView()
        
        return view
    }()
    private lazy var lbProfileInfo: UILabel = {
        let label = UILabel()
        
        label.text = "프로필 정보"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }()
    private lazy var lbEmail: UILabel = {
        let label = UILabel()
        
        label.text = "유저 이메일"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }()
    public lazy var tfEmail: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "새로운 이메일을 입력해주세요!", attributes: [.foregroundColor: UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1)])
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 213/255, green: 213/255, blue: 213/255, alpha: 1).cgColor
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 0))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.isUserInteractionEnabled = false
        textField.delegate = self
        textField.text = AccountManager.shared.loginModel?.id
        
        return textField
    }()
    public lazy var btnUpdateEmail: UIButton = {
        let button = UIButton()
        
        button.setAttributedTitle(NSAttributedString(string: "변경", attributes: [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 14)]), for: .normal)
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }()
    private lazy var lbPassword: UILabel = {
        let label = UILabel()
        
        label.text = "유저 비밀번호"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }()
    public lazy var tfPassword: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "새로운 이메일을 입력해주세요!", attributes: [.foregroundColor: UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1)])
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 213/255, green: 213/255, blue: 213/255, alpha: 1).cgColor
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 0))
        textField.leftViewMode = .always
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.isUserInteractionEnabled = false
        textField.delegate = self
        textField.text = AccountManager.shared.loginModel?.password
        
        return textField
    }()
    public lazy var btnUpdatePassword: UIButton = {
        let button = UIButton()
        
        button.setAttributedTitle(NSAttributedString(string: "변경", attributes: [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 14)]), for: .normal)
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }()
}

extension ManageProfileView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case tfEmail:
            tfEmail.resignFirstResponder()
        case tfPassword:
            tfPassword.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
