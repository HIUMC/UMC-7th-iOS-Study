//
//  MyPageView.swift
//  MyKream
//
//  Created by 김호성 on 2024.10.04.
//

import UIKit
import SnapKit

class MyPageView: UIView {
    
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
        self.addSubview(topComponentsGroupView)
        
        topComponentsGroupView.addSubview(topButtonsGroupView)
        topButtonsGroupView.addSubview(btnSetting)
        topButtonsGroupView.addSubview(btnCamera)
        
        topComponentsGroupView.addSubview(profileGroupView)
        profileGroupView.addSubview(ivProfile)
        profileGroupView.addSubview(profileTextGroupView)
        profileTextGroupView.addSubview(lbName)
        profileTextGroupView.addSubview(lbFollower)
        profileTextGroupView.addSubview(lbFollowerNum)
        profileTextGroupView.addSubview(lbFollowing)
        profileTextGroupView.addSubview(lbFollowingNum)
        
        topComponentsGroupView.addSubview(botButtonsGroupView)
        botButtonsGroupView.addSubview(btnManageProfile)
        botButtonsGroupView.addSubview(btnShareProfile)
        
        self.addSubview(separatorView)
        
        topComponentsGroupView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(30)
            $0.leading.trailing.equalToSuperview().inset(32.5)
        }
        topButtonsGroupView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(25)
        }
        btnSetting.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(25)
        }
        btnCamera.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(25)
        }
        profileGroupView.snp.makeConstraints {
            $0.top.equalTo(topButtonsGroupView.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(90)
        }
        ivProfile.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.width.equalTo(90)
        }
        profileTextGroupView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(21)
            $0.leading.equalTo(ivProfile.snp.trailing).offset(16)
            $0.trailing.equalToSuperview()
        }
        lbName.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        lbFollower.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(lbName.snp.bottom).offset(6)
            $0.bottom.equalToSuperview()
        }
        lbFollowerNum.snp.makeConstraints {
            $0.leading.equalTo(lbFollower.snp.trailing).offset(4)
            $0.top.equalTo(lbName.snp.bottom).offset(6)
            $0.bottom.equalToSuperview()
        }
        lbFollowing.snp.makeConstraints {
            $0.leading.equalTo(lbFollowerNum.snp.trailing).offset(8)
            $0.top.equalTo(lbName.snp.bottom).offset(6)
            $0.bottom.equalToSuperview()
        }
        lbFollowingNum.snp.makeConstraints {
            $0.leading.equalTo(lbFollowing.snp.trailing).offset(4)
            $0.top.equalTo(lbName.snp.bottom).offset(6)
            $0.bottom.equalToSuperview()
        }
        botButtonsGroupView.snp.makeConstraints {
            $0.top.equalTo(profileGroupView.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(26)
        }
        btnManageProfile.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
        }
        btnShareProfile.snp.makeConstraints {
            $0.leading.equalTo(btnManageProfile.snp.trailing).offset(14)
            $0.width.equalTo(btnManageProfile.snp.width)
            $0.top.bottom.trailing.equalToSuperview()
        }
        separatorView.snp.makeConstraints {
            $0.top.equalTo(topComponentsGroupView.snp.bottom).offset(29)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(24)
        }
    }
    
    private lazy var topComponentsGroupView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var topButtonsGroupView: UIView = {
        let view = UIView()
        
        return view
    }()
    private lazy var btnSetting: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "setting"), for: .normal)
        
        return button
    }()
    private lazy var btnCamera: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "camera"), for: .normal)
        
        return button
    }()
    
    private lazy var profileGroupView: UIView = {
        let view = UIView()
        
        return view
    }()
    private lazy var ivProfile: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "profile.png")
        imageView.clipsToBounds = true
        
        return imageView
    }()
    private lazy var profileTextGroupView: UIView = {
        let view = UIView()
        
        return view
    }()
    private lazy var lbName: UILabel = {
        let label = UILabel()
        
        label.text = "Hosung.Kim_iOS"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }()
    private lazy var lbFollower: UILabel = {
        let label = UILabel()
        
        label.text = "팔로워"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }()
    private lazy var lbFollowerNum: UILabel = {
        let label = UILabel()
        
        label.text = "\(326)"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }()
    private lazy var lbFollowing: UILabel = {
        let label = UILabel()
        
        label.text = "팔로잉"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }()
    private lazy var lbFollowingNum: UILabel = {
        let label = UILabel()
        
        label.text = "\(20)"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }()
    
    private lazy var botButtonsGroupView: UIView = {
        let view = UIView()
        
        return view
    }()
    public lazy var btnManageProfile: UIButton = {
        let button = UIButton()
        
        button.setAttributedTitle(NSAttributedString(string: "프로필 관리", attributes: [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 9)]), for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.8
        button.layer.borderColor = UIColor(red: 213/255, green: 213/255, blue: 213/255, alpha: 1).cgColor
        
        return button
    }()
    public lazy var btnShareProfile: UIButton = {
        let button = UIButton()
        
        button.setAttributedTitle(NSAttributedString(string: "프로필 공유", attributes: [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 9)]), for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.8
        button.layer.borderColor = UIColor(red: 213/255, green: 213/255, blue: 213/255, alpha: 1).cgColor
        
        return button
    }()
    private lazy var separatorView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        
        return view
    }()
}
