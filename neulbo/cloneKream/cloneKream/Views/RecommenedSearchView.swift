//
//  RecommenedSearchView.swift
//  cloneKream
//
//  Created by 김서현 on 11/25/24.
//

import UIKit

class RecommenedSearchView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var title = UILabel().then {
        $0.text = "추천 검색어"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 15, weight: .heavy)
    }
    
    
    public lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        //$0.estimatedItemSize = .init(width: 128, height: 32)
        $0.minimumLineSpacing = 5
        $0.minimumInteritemSpacing = 5
        $0.scrollDirection = .horizontal
        $0.sectionInset = .zero
    })).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(SearchedCollectionViewCell.self, forCellWithReuseIdentifier: SearchedCollectionViewCell.identifier)
        $0.showsHorizontalScrollIndicator = false
    }
    
    
    private func setUpView() {
        addSubview(title)
        addSubview(collectionView)
        
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(15)
            $0.leading.equalTo(title.snp.leading)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(90)
        }
    }

}
