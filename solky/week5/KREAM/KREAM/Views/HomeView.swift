//
//  HomeView.swift
//  KREAM
//
//  Created by 이태림 on 10/31/24.
//

import UIKit
import SnapKit
import Then

class HomeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupScrollViews()
        setConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var homeScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
        
       
    public lazy var contentView = UIView()
    
    public lazy var segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.selectedSegmentIndex = 0
        
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ], for: .normal)
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ], for: .selected)
        $0.apportionsSegmentWidthsByContent = true
        
        
    }
    
    //밑줄 뷰
    public lazy var underlineView = UIView().then {
            $0.backgroundColor = .black
    }
    
    public let HomeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumInteritemSpacing = 9
        $0.minimumLineSpacing = 20
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
    
    public let ReleasedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 142, height: 237)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(ReleasedCollectionViewCell.self, forCellWithReuseIdentifier: ReleasedCollectionViewCell.identifier)
    }
    
    public let MustItemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 124, height: 165)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(MustItemCollectionViewCell.self, forCellWithReuseIdentifier: MustItemCollectionViewCell.identifier)
    }
    
    //검색 버튼
    public lazy var searchButton = UIButton().then {
        
        
        $0.setTitle("  브랜드, 상품, 프로필, 태그 등", for: .normal)
        $0.setTitleColor(UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1.00), for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 13.5, weight: .medium)
        $0.contentHorizontalAlignment = .left
        $0.layer.cornerRadius = 12
        $0.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
    }
    
    // 종 이미지
    private lazy var bellimage: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    // 지금도 늦지 않았다 이미지
    public lazy var dontlateimage: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    public lazy var separateview1 = UIView().then {
        $0.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
    }
    
    public lazy var dropLabel = UILabel().then {
        $0.text = "Just Dropped"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textAlignment = .left
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    public lazy var releasedLabel = UILabel().then {
        $0.text = "발매 상품"
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.textAlignment = .left
        $0.textColor = UIColor(red: 0.53, green: 0.53, blue: 0.53, alpha: 1.00)
    }
    
    public lazy var separateview2 = UIView().then {
        $0.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
    }
    
    public lazy var mustitLabel = UILabel().then {
        $0.text = "본격 한파대비! 연말 필수템 모음"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textAlignment = .left
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    public lazy var happyLabel = UILabel().then {
        $0.text = "#해피홀리룩챌린지"
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.textAlignment = .left
        $0.textColor = UIColor(red: 0.53, green: 0.53, blue: 0.53, alpha: 1.00)
    }
    
    
    private func setupScrollViews() {
        self.addSubview(homeScrollView)
        homeScrollView.addSubview(contentView)
            
        contentView.addSubview(searchButton)
        contentView.addSubview(bellimage)
        contentView.addSubview(segmentedControl)
        contentView.addSubview(dontlateimage)
        contentView.addSubview(HomeCollectionView)
        contentView.addSubview(underlineView)
        contentView.addSubview(separateview1)
        contentView.addSubview(dropLabel)
        contentView.addSubview(releasedLabel)
        contentView.addSubview(ReleasedCollectionView)
        contentView.addSubview(separateview2)
        contentView.addSubview(mustitLabel)
        contentView.addSubview(happyLabel)
        contentView.addSubview(MustItemCollectionView)
        
        bellimage.image = UIImage(named: "bell")
        dontlateimage.image = UIImage(named: "dontlate")
    }
    
    
    private func setConstaints() {
        
        homeScrollView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
                
        contentView.snp.makeConstraints {
            $0.edges.equalTo(homeScrollView)
            $0.width.equalTo(homeScrollView.snp.width)
            $0.bottom.equalTo(MustItemCollectionView.snp.bottom).offset(30)
        }
        
        searchButton.snp.makeConstraints {
            $0.top.equalTo(contentView.safeAreaLayoutGuide).offset(6)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(40)
        }
        
        bellimage.snp.makeConstraints {
            $0.top.equalTo(contentView.safeAreaLayoutGuide).offset(14)
            $0.leading.equalTo(searchButton.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchButton.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-25)
            $0.height.equalTo(27)
        }
        
        dontlateimage.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(0)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(336)
        }
        
        HomeCollectionView.snp.makeConstraints {
            $0.top.equalTo(dontlateimage.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-17)
            $0.height.equalTo(200)
        }
        
        separateview1.snp.makeConstraints {
            $0.top.equalTo(HomeCollectionView.snp.bottom).offset(30)
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        dropLabel.snp.makeConstraints {
            $0.top.equalTo(separateview1.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(19)
        }
        
        releasedLabel.snp.makeConstraints {
            $0.top.equalTo(dropLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(16)
        }
        
        ReleasedCollectionView.snp.makeConstraints {
            $0.top.equalTo(releasedLabel.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(442)
            $0.height.equalTo(260)
        }
        
        separateview2.snp.makeConstraints {
            $0.top.equalTo(ReleasedCollectionView.snp.bottom).offset(30)
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        mustitLabel.snp.makeConstraints {
            $0.top.equalTo(separateview2.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(19)
        }
        
        happyLabel.snp.makeConstraints {
            $0.top.equalTo(mustitLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(16)
        }
        
        MustItemCollectionView.snp.makeConstraints {
            $0.top.equalTo(happyLabel.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(400)
            $0.height.equalTo(165)
        }
    }
    
    
}

