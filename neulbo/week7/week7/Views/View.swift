//
//  View.swift
//  week7
//
//  Created by 김서현 on 11/17/24.
//

import UIKit
import Then
import SnapKit

class View: UIView {
    
    public lazy var searchTextfield = UITextField().then {
        $0.placeholder = "검색하고 싶은 것을 넣으세요!"
        $0.leftViewMode = .always
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 1))
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    public lazy var searchButton = UIButton().then {
        $0.setTitle("검색", for: .normal)
        $0.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "타이틀"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    public lazy var titleText = UILabel().then {
        $0.text = "이 부분에 title 값이 들어오도록 해주세요!"
        $0.font = .systemFont(ofSize: 20, weight: .light)
        $0.numberOfLines = 0
    }
    
    private lazy var contentLabel = UILabel().then {
        $0.text = "컨텐츠"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    public lazy var contentText = UILabel().then {
        $0.text = "이 부분에 contents 값이 들어오도록 해주세요!"
        $0.font = .systemFont(ofSize: 20, weight: .light)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byCharWrapping
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        addSubview(searchTextfield)
        addSubview(searchButton)
        addSubview(titleLabel)
        addSubview(titleText)
        addSubview(contentLabel)
        addSubview(contentText)
        
        searchTextfield.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(50)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-100)
            $0.height.equalTo(40)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(searchTextfield)
            $0.leading.equalTo(searchTextfield.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(searchTextfield.snp.bottom).offset(60)
        }
        
        titleText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(30)
        }
        
        contentLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        contentText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(contentLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(30)
        }
    }
    
}
