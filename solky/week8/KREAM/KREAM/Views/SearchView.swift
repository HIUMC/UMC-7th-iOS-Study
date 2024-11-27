//
//  SearchView.swift
//  KREAM
//
//  Created by 이태림 on 10/31/24.
//

import UIKit
import SnapKit
import Then

class SearchView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var searchButton = UIButton().then {
        
        $0.setTitle("   브랜드, 상품, 프로필, 태그 등", for: .normal)
        $0.setTitleColor(UIColor(red: 0.72, green: 0.72, blue: 0.72, alpha: 1.00), for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 13.5, weight: .medium)
        $0.contentHorizontalAlignment = .left
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
    }
    
    public lazy var cancelButton = UIButton().then {
       
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.00), for: .normal)
        $0.backgroundColor = .clear
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    public lazy var recommendLabel = UILabel().then {
        $0.text = "추천 검색어"
        $0.font = .systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .black
    }
    
    public let recommendCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.minimumInteritemSpacing = 8
        $0.minimumLineSpacing = 12
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
    }
    
    private func setViews() {
        self.addSubview(searchButton)
        self.addSubview(cancelButton)
        self.addSubview(recommendLabel)
        self.addSubview(recommendCollectionView)
    
    }
    
    private func setConstraints() {
        
        searchButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(7)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-52)
            $0.height.equalTo(39)
        }
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(18)
            $0.leading.equalTo(searchButton.snp.trailing).offset(11)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(17)
        }
        
        recommendLabel.snp.makeConstraints {
            $0.top.equalTo(searchButton.snp.bottom).offset(41)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-289)
            $0.height.equalTo(18)
        }
        
        recommendCollectionView.snp.makeConstraints {
            $0.top.equalTo(recommendLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview().offset(15)
            $0.width.equalTo(329)
            $0.bottom.equalToSuperview()
        }
        
    }
}
