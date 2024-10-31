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
        setViews()
        setConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    let HomeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumInteritemSpacing = 9
        $0.minimumLineSpacing = 20
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
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
    
    private func setViews() {
        self.addSubview(searchButton)
        self.addSubview(bellimage)
        self.addSubview(segmentedControl)
        self.addSubview(dontlateimage)
        self.addSubview(HomeCollectionView)
        self.addSubview(underlineView)
        
        bellimage.image = UIImage(named: "bell")
        dontlateimage.image = UIImage(named: "dontlate")
    }
    
    
    private func setConstaints() {
        searchButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(6)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(40)
        }
        
        bellimage.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(14)
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
            $0.bottom.equalToSuperview().offset(-138)
        }
    }
    
    
}
