//
//  HomeView.swift
//  KREAM
//
//  Created by 주민영 on 10/28/24.
//

import UIKit

class HomeView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public let searchBar = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 13.5, weight: .medium)
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        
        $0.layer.cornerRadius = 12
        
        $0.backgroundColor = .systemGray6
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        $0.leftViewMode = .always
    }
    
    private let alertButton = UIButton().then {
        $0.setImage(.iconAlert, for: .normal)
    }
    
    private lazy var topStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.alignment = .center
        $0.spacing = 15
    }
    
    let segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
        $0.selectedSegmentIndex = 0
    }
    
    let underLineView = UIView().then {
        $0.backgroundColor = .black
    }
    
    let adImageView = UIImageView().then {
        $0.image = UIImage(named: "image_ad")
    }
    
    let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumInteritemSpacing = 9
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
    }
    
    private let divideLine = UIView().then {
        $0.backgroundColor = .systemGray6
    }
    
    private func setupView() {
        topStackView.addArrangedSubview(searchBar)
        topStackView.addArrangedSubview(alertButton)
        
        [
            topStackView,
            segmentedControl,
            underLineView,
            adImageView,
            menuCollectionView,
            divideLine
        ].forEach {
            addSubview($0)
        }
        
        topStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(6)
            $0.centerX.equalToSuperview()
        }
        
        searchBar.snp.makeConstraints {
            $0.width.equalTo(303)
            $0.height.equalTo(40)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(16)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(19)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(8)
            $0.leading.equalTo((self.bounds.width / CGFloat(segmentedControl.numberOfSegments)) * CGFloat(segmentedControl.selectedSegmentIndex) + 16)
            $0.width.equalTo(segmentedControl.snp.width).multipliedBy(0.5/CGFloat(segmentedControl.numberOfSegments))
            $0.height.equalTo(2)
        }
        
        adImageView.snp.makeConstraints {
            $0.top.equalTo(underLineView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(336)
        }
        
        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(adImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(341)
            $0.height.equalTo(182)
        }
        
        divideLine.snp.makeConstraints {
            $0.top.equalTo(menuCollectionView.snp.bottom).offset(30)
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
