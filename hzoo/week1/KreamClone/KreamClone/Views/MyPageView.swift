//
//  MyPageView.swift
//  KreamClone
//
//  Created by 이현주 on 10/7/24.
//

import UIKit
import SnapKit
import Then

class MyPageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponenets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var myData: MyModel = MyModel(nickname: "Jeong_iOS", followers: 326, followings: 20)
    
    public lazy var settings: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(systemName: "gearshape", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular)), for: .normal)
        b.tintColor = .black
        return b
    }()
    
    public lazy var camera: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(systemName: "camera", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .regular)), for: .normal)
        b.tintColor = .black
        return b
    }()
    
    public lazy var profileImg: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "profile")
        i.layer.cornerRadius = 45
        i.layer.masksToBounds = true
        i.contentMode = .scaleAspectFill
        return i
    }()
    
    public lazy var nickname: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        l.text = "\(myData.nickname)"
        l.textColor = .black
        return l
    }()
    
    public lazy var follower: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        l.text = "팔로워 \(myData.followers)"
        let attributedStr = NSMutableAttributedString(string: l.text!)
        attributedStr.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .semibold), range: (l.text! as NSString).range(of: "\(myData.followers)"))
        l.attributedText = attributedStr
        return l
    }()
    
    public lazy var following: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        l.text = "팔로잉 \(myData.followings)"
        let attributedStr = NSMutableAttributedString(string: l.text!)
        attributedStr.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .semibold), range: (l.text! as NSString).range(of: "\(myData.followings)"))
        l.attributedText = attributedStr
        return l
    }()
    
    public lazy var followStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [follower, following])
        stackView.axis = .horizontal // 수평으로 배치
        stackView.spacing = 8 // 레이블과 텍스트필드 사이 간격
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    public lazy var profileLblStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nickname, followStackView])
        stackView.axis = .vertical // 수직으로 배치
        stackView.spacing = 6 // 레이블과 텍스트필드 사이 간격
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    public lazy var profileManage: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("프로필 관리", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        
        b.layer.borderColor = UIColor(hex: "#D5D5D5")?.cgColor
        b.layer.borderWidth = 0.8
        b.layer.cornerRadius = 8
        b.layer.masksToBounds = true
        return b
    }()
    
    public lazy var profileShare: UIButton = {
        let b = UIButton()
        b.setTitle("프로필 공유", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        
        b.layer.borderColor = UIColor(hex: "#D5D5D5")?.cgColor
        b.layer.borderWidth = 0.8
        b.layer.cornerRadius = 8
        b.layer.masksToBounds = true
        
        return b
    }()
    
    public lazy var profileBtnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileManage, profileShare])
        stackView.axis = .horizontal // 수평으로 배치
        stackView.spacing = 14 // 레이블과 텍스트필드 사이 간격
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    public lazy var bar: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hex: "#D5D5D5")
        return v
    }()
    
    private func addComponenets() {
        addSubview(settings)
        addSubview(camera)
        addSubview(profileImg)
        addSubview(profileLblStackView)
        addSubview(profileBtnStackView)
        addSubview(bar)
        
        settings.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(30)
            $0.leading.equalToSuperview().offset(32.5)
            $0.width.height.equalTo(30)
        }
        
        camera.snp.makeConstraints {
            $0.centerY.equalTo(settings)
            $0.trailing.equalToSuperview().offset(-32.5)
            $0.width.equalTo(35)
        }
        
        profileImg.snp.makeConstraints {
            $0.top.equalTo(settings.snp.bottom).offset(26)
            $0.leading.equalTo(settings.snp.leading)
            $0.width.height.equalTo(90)
        }
        
        profileLblStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImg.snp.trailing).offset(16)
            $0.centerY.equalTo(profileImg)
        }
        
        profileBtnStackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(32.5)
            $0.top.equalTo(profileImg.snp.bottom).offset(26)
            $0.height.equalTo(26)
        }
        
        bar.snp.makeConstraints {
            $0.top.equalTo(profileBtnStackView.snp.bottom).offset(30)
            $0.width.equalToSuperview()
            $0.height.equalTo(24)
        }
    }
    
}
