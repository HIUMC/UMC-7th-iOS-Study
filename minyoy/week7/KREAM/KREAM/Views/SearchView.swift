//
//  SearchView.swift
//  KREAM
//
//  Created by 주민영 on 10/29/24.
//

import UIKit

class SearchView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let searchBar = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 13.5, weight: .medium)
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        
        $0.layer.cornerRadius = 12
        
        $0.backgroundColor = .systemGray6
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        $0.leftViewMode = .always
    }
    
    let cancelButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 10)
    }
    
    private lazy var topStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.alignment = .center
        $0.spacing = 15
    }
    
    private func setupView() {
        topStackView.addArrangedSubview(searchBar)
        topStackView.addArrangedSubview(cancelButton)
        
        addSubview(topStackView)
        
        topStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(6)
            $0.centerX.equalToSuperview()
        }
        
        searchBar.snp.makeConstraints {
            $0.width.equalTo(303)
            $0.height.equalTo(40)
        }
        
        cancelButton.snp.makeConstraints {
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
    }

}
