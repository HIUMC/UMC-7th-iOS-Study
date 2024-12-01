//
//  SearchDetailView.swift
//  KREAM
//
//  Created by 이태림 on 11/25/24.
//

import UIKit
import SnapKit
import Then

class SearchDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var backButton = UIButton().then {
        $0.setImage(UIImage(named: "leftback"), for: .normal)
        $0.backgroundColor = .clear
    }
    
    public lazy var searchtextfield = UITextField().then {
        $0.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        $0.layer.cornerRadius = 10
        $0.attributedPlaceholder = NSAttributedString(string: "브랜드, 상품, 프로필, 태그 등", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.72, green: 0.72, blue: 0.72, alpha: 1.00), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13.5, weight: .medium)])
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
    }
    
    public lazy var cancelButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.00), for: .normal)
        $0.backgroundColor = .clear
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    public lazy var searchtableView = UITableView().then {
        $0.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        $0.separatorStyle = .none
        $0.backgroundColor = .white
    }
    
    private func setViews() {
        addSubview(backButton)
        addSubview(searchtextfield)
        addSubview(cancelButton)
        addSubview(searchtableView)
    }
    
    private func setConstraint() {
        backButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(14)
            $0.leading.equalToSuperview().offset(15)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        
        searchtextfield.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(7)
            $0.leading.equalTo(backButton.snp.trailing).offset(15)
            $0.width.equalTo(268)
            $0.height.equalTo(39)
        }
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(18)
            $0.leading.equalTo(searchtextfield.snp.trailing).offset(11)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(17)
        }
        
        searchtableView.snp.makeConstraints {
            $0.top.equalTo(searchtextfield.snp.bottom).offset(31)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.bottom.equalToSuperview()
        }
    }
    
        
    
}
