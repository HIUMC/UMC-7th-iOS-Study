//
//  SearchDetailView.swift
//  KREAM
//
//  Created by 주민영 on 11/20/24.
//

import UIKit

class SearchDetailView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        self.emptyLabel.isHidden = true
        
        setupStack()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let previousBtn = UIButton().then {
        $0.setImage(UIImage(named: "icon_leftArrow"), for: .normal)
    }

    let searchBar = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 13.5, weight: .medium)
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        
        $0.layer.cornerRadius = 12
        
        $0.backgroundColor = .systemGray6
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        $0.leftViewMode = .always
    }
    
    let cancelBtn = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    private lazy var topStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .center
        $0.spacing = 15
    }
    
    private lazy var divideLine = UIView().then {
        $0.backgroundColor = .systemGray6
    }
    
    public lazy var titleTableView = UITableView().then {
        $0.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        $0.separatorStyle = .none
    }
    
    public lazy var emptyLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.text = "검색 결과가 없습니다."
    }
    
    private func setupStack() {
        [
            previousBtn,
            searchBar,
            cancelBtn
        ].forEach {
            topStackView.addArrangedSubview($0)
        }
        
        previousBtn.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        
        searchBar.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        cancelBtn.snp.makeConstraints {
            $0.width.equalTo(25)
            $0.height.equalTo(17)
        }
    }
    
    private func setupView() {
        [
            topStackView,
            divideLine,
            titleTableView,
            emptyLabel
        ].forEach {
            addSubview($0)
        }
        
        topStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(6)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        divideLine.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(11)
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        titleTableView.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.bottom.equalToSuperview()
        }
        
        emptyLabel.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(31)
            $0.centerX.equalToSuperview()
        }
    }
}
