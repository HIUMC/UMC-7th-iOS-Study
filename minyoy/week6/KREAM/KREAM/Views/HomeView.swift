//
//  HomeView.swift
//  KREAM
//
//  Created by 주민영 on 10/28/24.
//

import UIKit
import SnapKit
import Then

class HomeView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupTopView()
        setupMainView()
        setupScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // HomeView 구성
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
    
    // homeScrollView 구성
    public lazy var homeScrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = false
    }
    
    private let recommendView = UIView()
    
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
        $0.tag = 0
    }
    
    private let divideLine1 = UIView().then {
        $0.backgroundColor = .systemGray6
    }
    
    private let justDroppedLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .black
        $0.text = "Just Dropped"
    }
    
    private let releasedProductLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .light)
        $0.textColor = .gray
        $0.text = "발매 상품"
    }
    
    let productCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 142, height: 237)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.backgroundColor = .clear
        $0.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        $0.tag = 1
    }
    
    private let divideLine2 = UIView().then {
        $0.backgroundColor = .systemGray6
    }
    
    private let headlineLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .black
        $0.text = "본격 한파대비! 연말 필수템 모음"
    }
    
    private let hashtagLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .light)
        $0.textColor = .gray
        $0.text = "#해피홀리룩챌린지"
    }
    
    let imageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 124, height: 165)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.backgroundColor = .clear
        $0.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        $0.tag = 2
    }
    
    private func setupTopView() {
        topStackView.addArrangedSubview(searchBar)
        topStackView.addArrangedSubview(alertButton)
        addSubview(topStackView)
        
        topStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(6)
            $0.centerX.equalToSuperview()
        }
        
        searchBar.snp.makeConstraints {
            $0.width.equalTo(303)
            $0.height.equalTo(40)
        }
    }
    
    private func setupMainView() {
        addSubview(segmentedControl)
        addSubview(underLineView)
        addSubview(homeScrollView)
        
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
        
        homeScrollView.snp.makeConstraints {
            $0.top.equalTo(underLineView.snp.bottom)
            $0.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    private func setupScrollView() {
        homeScrollView.addSubview(recommendView)
        
        recommendView.snp.makeConstraints {
            $0.edges.equalTo(homeScrollView)
            $0.width.equalTo(homeScrollView.snp.width)
        }
        
        [
            adImageView,
            menuCollectionView,
            divideLine1,
            justDroppedLabel,
            releasedProductLabel,
            productCollectionView,
            divideLine2,
            headlineLabel,
            hashtagLabel,
            imageCollectionView
        ].forEach {
            recommendView.addSubview($0)
        }
        
        adImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(336)
        }
        
        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(adImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(182)
        }
        
        divideLine1.snp.makeConstraints {
            $0.top.equalTo(menuCollectionView.snp.bottom).offset(30)
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        justDroppedLabel.snp.makeConstraints {
            $0.top.equalTo(divideLine1.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
        }
        
        releasedProductLabel.snp.makeConstraints {
            $0.top.equalTo(justDroppedLabel.snp.bottom).offset(4)
            $0.leading.equalTo(justDroppedLabel.snp.leading)
        }
        
        productCollectionView.snp.makeConstraints {
            $0.top.equalTo(releasedProductLabel.snp.bottom).offset(14)
            $0.leading.equalTo(justDroppedLabel.snp.leading)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(237)
        }
        
        divideLine2.snp.makeConstraints {
            $0.top.equalTo(productCollectionView.snp.bottom).offset(30)
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        headlineLabel.snp.makeConstraints {
            $0.top.equalTo(divideLine2.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
        }
        
        hashtagLabel.snp.makeConstraints {
            $0.top.equalTo(headlineLabel.snp.bottom).offset(4)
            $0.leading.equalTo(headlineLabel.snp.leading)
        }
        
        imageCollectionView.snp.makeConstraints {
            $0.top.equalTo(hashtagLabel.snp.bottom).offset(14)
            $0.leading.equalTo(headlineLabel.snp.leading)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(165)
            $0.bottom.equalToSuperview().offset(-30)
        }
    }
}
