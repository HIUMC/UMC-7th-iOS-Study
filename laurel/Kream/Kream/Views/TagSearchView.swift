//
//  SearchView.swift
//  Kream
//
//  Created by 어진 on 11/25/24.
//

import UIKit
import Then
import SnapKit

class TagSearchView: UIView {

    // MARK: - UI Components

    let searchBar = UISearchBar().then {
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.searchBarStyle = .minimal
    }

    let cancelButton = UIButton(type: .system).then {
        $0.setTitle("취소", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        $0.setTitleColor(.black, for: .normal)
    }

    let titleLabel = UILabel().then {
        $0.text = "추천 검색어"
        $0.font = UIFont.boldSystemFont(ofSize: 18)
    }

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.minimumLineSpacing = 10
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .vertical
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }).then {
        $0.backgroundColor = .clear
    }

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Setup

    private func setupUI() {
        backgroundColor = .white
        addSubview(searchBar)
        addSubview(cancelButton)
        addSubview(titleLabel)
        addSubview(collectionView)
    }

    private func setupConstraints() {
        searchBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(0)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalTo(cancelButton.snp.leading).offset(-8)
        }

        cancelButton.snp.makeConstraints {
            $0.centerY.equalTo(searchBar)
            $0.trailing.equalToSuperview().offset(-16)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(16)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
