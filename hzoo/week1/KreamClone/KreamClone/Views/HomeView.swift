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
    
    public lazy var scrollView: UIScrollView = {
        let s = UIScrollView()
        s.showsVerticalScrollIndicator = true
        s.showsHorizontalScrollIndicator = false
        return s
    }()
    
    public lazy var contentView: UIView = {
        let v = UIView()
        return v
    }()
    
    public lazy var adImg: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "adImage")
        i.contentMode = .scaleAspectFill
        return i
    }()
    
    public let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumInteritemSpacing = 9
    }).then {
        $0.register(HomeMenuCollectionViewCell.self, forCellWithReuseIdentifier: HomeMenuCollectionViewCell.identifier)
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.tag = 0
    }
    
    public lazy var line1: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hex: "#F2F2F2")
        return v
    }()
    
    public lazy var title1: UILabel = {
        let l = UILabel()
        l.text = "Just Dropped"
        l.textColor = .black
        l.font = .systemFont(ofSize: 16, weight: .semibold)
        return l
    }()
    
    public lazy var subTitle1: UILabel = {
        let l = UILabel()
        l.text = "발매 상품"
        l.textColor = UIColor(hex: "#878787")
        l.font = .systemFont(ofSize: 13, weight: .light)
        return l
    }()
    
    public let droppedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 142, height: 237)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
        $0.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }).then {
        $0.register(DroppedCollectionViewCell.self, forCellWithReuseIdentifier: DroppedCollectionViewCell.identifier)
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.tag = 1
    }
    
    public lazy var line2: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hex: "#F2F2F2")
        return v
    }()
    
    public lazy var title2: UILabel = {
        let l = UILabel()
        l.text = "본격 한파대비! 연말 필수템 모음"
        l.textColor = .black
        l.font = .systemFont(ofSize: 16, weight: .semibold)
        return l
    }()
    
    public lazy var subTitle2: UILabel = {
        let l = UILabel()
        l.text = "#해피홀리룩챌린지"
        l.textColor = UIColor(hex: "#878787")
        l.font = .systemFont(ofSize: 13, weight: .light)
        return l
    }()

    public let challengeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 124, height: 165)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
        $0.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }).then {
        $0.register(ChallengeCollectionViewCell.self, forCellWithReuseIdentifier: ChallengeCollectionViewCell.identifier)
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.tag = 2
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
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(adImg)
        contentView.addSubview(menuCollectionView)
        
        contentView.addSubview(line1)
        contentView.addSubview(title1)
        contentView.addSubview(subTitle1)
        contentView.addSubview(droppedCollectionView)
        
        contentView.addSubview(line2)
        contentView.addSubview(title2)
        contentView.addSubview(subTitle2)
        contentView.addSubview(challengeCollectionView)
        
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
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(underLineView.snp.bottom)
            make.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView) // 스크롤뷰의 모든 가장자리에 맞춰 배치
            make.width.equalTo(scrollView.snp.width) // 가로 스크롤을 방지, 스크롤뷰와 같은 너비로 설정
        }
        
        adImg.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(336)
        }
        
        menuCollectionView.snp.makeConstraints { make in
            make.top.equalTo(adImg.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(182)
        }
        
        line1.snp.makeConstraints { make in
            make.top.equalTo(menuCollectionView.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
        
        title1.snp.makeConstraints { make in
            make.top.equalTo(line1.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
        }
        
        subTitle1.snp.makeConstraints { make in
            make.top.equalTo(title1.snp.bottom).offset(4)
            make.leading.equalTo(title1.snp.leading)
        }
        
        droppedCollectionView.snp.makeConstraints { make in
            make.top.equalTo(subTitle1.snp.bottom).offset(14)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(237)
        }
        
        line2.snp.makeConstraints { make in
            make.top.equalTo(droppedCollectionView.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
        
        title2.snp.makeConstraints { make in
            make.top.equalTo(line2.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
        }
        
        subTitle2.snp.makeConstraints { make in
            make.top.equalTo(title2.snp.bottom).offset(4)
            make.leading.equalTo(title1.snp.leading)
        }
        
        challengeCollectionView.snp.makeConstraints { make in
            make.top.equalTo(subTitle2.snp.bottom).offset(14)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(165)
            make.bottom.equalToSuperview().offset(-30) //필수!!!
        }
        
        contentView.snp.makeConstraints { make in
            make.bottom.equalTo(challengeCollectionView.snp.bottom).offset(30)
        }
    }
}
