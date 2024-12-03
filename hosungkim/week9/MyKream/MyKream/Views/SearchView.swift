//
//  SearchView.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.01.
//

import UIKit

class SearchView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    private func addComponents() {
        self.addSubview(tfSearch)
        self.addSubview(btnCancel)
        self.addSubview(separatorView)
        self.addSubview(lbRecommend)
        self.addSubview(cvRecommend)
        
        tfSearch.snp.makeConstraints({
            $0.top.equalTo(safeAreaLayoutGuide).offset(6)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        })
        btnCancel.snp.makeConstraints({
            $0.width.equalTo(40)
            $0.centerY.equalTo(tfSearch)
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(tfSearch.snp.trailing).offset(11)
        })
        separatorView.snp.makeConstraints({
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(tfSearch.snp.bottom).offset(11)
        })
        lbRecommend.snp.makeConstraints({
            $0.top.equalTo(separatorView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(16)
        })
        cvRecommend.snp.makeConstraints({
            $0.top.equalTo(lbRecommend.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(16)
        })
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public lazy var tfSearch: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "브랜드, 상품, 프로필, 태그 등", attributes: [.foregroundColor: UIColor(red: 182/255, green: 182/255, blue: 182/255, alpha: 1)])
        textField.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        textField.layer.cornerRadius = 12
        textField.font = UIFont.systemFont(ofSize: 13.5)
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        
        return textField
    }()
    public lazy var btnCancel: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("취소", for: .normal)
        return button
    }()
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
        return view
    }()
    private lazy var lbRecommend: UILabel = {
        let label = UILabel()
        label.text = "추천 검색어"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    public lazy var cvRecommend: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        collectionView.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
        collectionView.contentInsetAdjustmentBehavior = .always
        return collectionView
    }()
}
