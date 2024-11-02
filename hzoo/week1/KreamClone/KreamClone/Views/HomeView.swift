//
//  HomeView.swift
//  KreamClone
//
//  Created by 이현주 on 10/30/24.
//

import UIKit
import SnapKit
import Then

class HomeView: UIView {
    
    public lazy var searchBtn: UIButton = {
        let b = UIButton()
        var configuration = UIButton.Configuration.plain()

        // 타이틀 속성 설정
        let attributes: AttributeContainer = AttributeContainer([
            .font: UIFont.systemFont(ofSize: 13.5, weight: .regular), .foregroundColor: UIColor(hex: "#B6B6B6") ?? .gray])
        configuration.attributedTitle = AttributedString("브랜드, 상품, 프로필, 태그 등", attributes: attributes)
        configuration.titleAlignment = .leading // 제목만 왼쪽 정렬
        
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0) // 여백 설정

        // 버튼 설정
        b.configuration = configuration
        
        b.layer.cornerRadius = 12
        b.contentHorizontalAlignment = .left // 버튼 전체의 내용 정렬을 왼쪽으로 설정
        b.layer.masksToBounds = true
        b.backgroundColor = UIColor(hex: "#F5F5F5")
        return b
    }()
    
    public lazy var alarmBtn: UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        b.setImage(.alarm, for: .normal)
        return b
    }()
    
    public let segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.selectedSegmentIndex = 0
        $0.apportionsSegmentWidthsByContent = true
        
        $0.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 16, weight: .light)
        ], for: .normal)
        
        $0.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 16, weight: .bold)
        ], for: .selected)
    }
    
    public lazy var underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    public lazy var adImg: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "adImage")
        i.contentMode = .scaleAspectFit
        return i
    }()
    
    public let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumInteritemSpacing = 9
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(HomeMenuCollectionViewCell.self, forCellWithReuseIdentifier: HomeMenuCollectionViewCell.identifier)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addComponents() {
        addSubview(searchBtn)
        addSubview(alarmBtn)
        addSubview(segmentedControl)
        addSubview(underLineView)
        addSubview(adImg)
        addSubview(menuCollectionView)
        
        searchBtn.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(6)
            make.leading.equalTo(safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(alarmBtn.snp.leading).offset(-15)
            make.height.equalTo(40)
        }
        
        alarmBtn.snp.makeConstraints { make in
            make.centerY.equalTo(searchBtn)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(16)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(searchBtn.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(15)
            make.height.equalTo(27)
        }
        
        underLineView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.leading.equalTo(segmentedControl.snp.leading).offset(8)
            make.height.equalTo(2)
            make.width.equalTo(32)
        }
        
        adImg.snp.makeConstraints { make in
            make.top.equalTo(underLineView.snp.bottom)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(336)
        }
        
        menuCollectionView.snp.makeConstraints { make in
            make.top.equalTo(adImg.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-48)
        }
    }
}
