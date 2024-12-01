//
//  searchView.swift
//  Kream
//
//  Created by KoNangYeon on 11/3/24.
//

import UIKit
import SnapKit
import Then

class searchView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addStack()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let homeView = HOMEView()
    
    lazy var searchBar = homeView.searchBar
    
    lazy var btn = CustomButton1().then {
        $0.configLabel(text: "취소", size: 14, weight: .medium)
    }
    
    private lazy var line = homeView.divideLine
    
    private lazy var title = Label(title: "추천 검색어", size: 15, weight: .heavy)
    
    lazy var searchCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.minimumInteritemSpacing = 8
        $0.minimumLineSpacing = 12
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.itemSize = CGSize(width: 60, height: 32)
    }).then {
        $0.isScrollEnabled = false
        $0.register(searchViewCell.self, forCellWithReuseIdentifier: searchViewCell.identifier)
    }
    
    lazy var searchStack = Stack(axis: .horizontal, spacing: 11)
    private lazy var searchStack1 = Stack(axis: .vertical, spacing: 11)
    
    private func addStack() {
        [searchBar, btn].forEach{searchStack.addArrangedSubview($0)}
        [title, searchCollectionView].forEach{searchStack1.addArrangedSubview($0)}
    }
    
    private func setupView() {
        [
            searchStack, line, searchStack1
        ].forEach{addSubview($0)}

        searchStack.snp.makeConstraints{
            $0.top.equalTo(safeAreaLayoutGuide).inset(7)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(39)
        }
        
        line.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(searchStack.snp.bottom).offset(11)
        }
        
        searchStack1.snp.makeConstraints{
            $0.top.equalTo(line.snp.bottom).offset(30)
            $0.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(16)
            $0.height.greaterThanOrEqualTo(110)
        }
        
        searchCollectionView.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview()
            $0.height.greaterThanOrEqualTo(100)
        }
    }
}
