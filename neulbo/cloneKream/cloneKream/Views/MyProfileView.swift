//
//  MyPageProfile.swift
//  cloneKream
//
//  Created by 김서현 on 10/2/24.
//

import UIKit
import SnapKit

class MyProfileView: UIView {
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        if let image = UIImage(named: "userProfile") {
            imageView.image = image
        }
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 45
        return imageView
    }()
    
    private let userId: UILabel = {
        let label = UILabel()
        label.text = "tokkislove"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let followerLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로워"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private let followerNum: UILabel = {
        let label = UILabel()
        label.text = "326"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var followerStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followerLabel, followerNum])
        stackView.axis = .horizontal
        stackView.spacing = 7
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private let followingLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로잉"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private let followingNum: UILabel = {
        let label = UILabel()
        label.text = "20"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var followingStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followingLabel, followingNum])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private lazy var followStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followerStack, followingStack])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var userInfoStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userId, followStack])
        stackView.axis = .vertical
        stackView.spacing = 14
        return stackView
    }()
    
    private lazy var userStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImage, userInfoStack])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()
    
    private let manageButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 관리", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.8
        button.layer.borderColor = UIColor(red: 213/255, green: 213/255, blue: 213/255, alpha: 1).cgColor
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 공유", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.8
        button.layer.borderColor = UIColor(red: 213/255, green: 213/255, blue: 213/255, alpha: 1).cgColor
        return button
    }()
    
    private lazy var buttonStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [manageButton, shareButton])
        stackView.axis = .horizontal
        stackView.spacing = 14
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(userStack)
        addSubview(buttonStack)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        
        profileImage.snp.makeConstraints {
            $0.width.height.equalTo(90)
        }
        
        userStack.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(32)
            $0.top.equalToSuperview().inset(100)
        }
        
        buttonStack.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userStack.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(32)
        }
        
        
    }
    
    
    // closure: 함수 chunk
    var buttonAction: (() -> Void)?
    
    @objc private func buttonTapped() {
        buttonAction?() // 함수로서 클로저 실행
    }
    
    func addAction() {
        manageButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }


}
