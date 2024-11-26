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
    
    let cancelButton = UIButton().then {
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
    
    private lazy var searchRec = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .heavy)
        $0.textColor = .black
        $0.text = "추천 검색어"
    }
    
    let searchRecCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.minimumInteritemSpacing = 8
        $0.minimumLineSpacing = 12
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(SearchRecCollectionViewCell.self, forCellWithReuseIdentifier: SearchRecCollectionViewCell.identifier)
    }
    
    private func setupView() {
        topStackView.addArrangedSubview(searchBar)
        topStackView.addArrangedSubview(cancelButton)
        
        [ 
            topStackView,
            divideLine,
            searchRec,
            searchRecCollectionView
        ].forEach {
            addSubview($0)
        }
        
        topStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(6)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        searchBar.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        cancelButton.snp.makeConstraints {
            $0.width.equalTo(25)
            $0.height.equalTo(17)
        }
        
        divideLine.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(11)
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        searchRec.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(30)
            $0.leading.equalTo(searchBar.snp.leading)
        }
        
        searchRecCollectionView.snp.makeConstraints {
            $0.top.equalTo(searchRec.snp.bottom).offset(11)
            $0.leading.equalToSuperview().offset(15)
            $0.width.equalTo(329)
            $0.bottom.equalToSuperview()
        }
    }

}
