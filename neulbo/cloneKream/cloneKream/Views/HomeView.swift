//
//  HomeView.swift
//  cloneKream
//
//  Created by 김서현 on 10/31/24.
//

import UIKit

class HomeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = false
        $0.isScrollEnabled = true
    }
    
    public lazy var contentView = UIView().then {
        $0.backgroundColor = .white
    }
    
    
    //let segmentedControl = CustomSegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"])
    
    
    let segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {

        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.selectedSegmentIndex = 0
        $0.apportionsSegmentWidthsByContent = true
        
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
    }
    
    public var underBar = UIView().then {
        $0.backgroundColor = .black
    }
    
    
    let mainImage = UIImageView().then {
        $0.image = UIImage(named: "main")
        $0.contentMode = .scaleAspectFill
    }
    
    let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumLineSpacing = 11
        $0.scrollDirection = .horizontal
    })).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(HomeMenuCollectionViewCell.self, forCellWithReuseIdentifier: HomeMenuCollectionViewCell.identifier)
    }
    
    private let divider1 = UIView().then {
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
    }
    
    let justDroppedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({
        $0.estimatedItemSize = .init(width: 142, height: 237)
        $0.minimumLineSpacing = 8
        $0.scrollDirection = .horizontal
    })).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: JustDroppedCollectionViewCell.identifier)
        $0.showsHorizontalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    private let justDroppedStack = UIStackView().then {
        let title = UILabel().then { title in
            title.text = "Just Dropped"
            title.font = .systemFont(ofSize: 16, weight: .semibold)
            title.textColor = .black
        }
        let description = UILabel().then { des in
            des.text = "발매 상품"
            des.font = .systemFont(ofSize: 13, weight: .light)
            des.textColor = UIColor(red: 135/255, green: 135/255, blue: 135/255, alpha: 1)
        }
        $0.addArrangedSubview(title)
        $0.addArrangedSubview(description)
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 7
    }
    
    private let divider2 = UIView().then {
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
    }
    
    private let challengeStack = UIStackView().then {
        let title = UILabel().then { title in
            title.text = "본격 한파대비! 연말 필수템 모음"
            title.font = .systemFont(ofSize: 16, weight: .semibold)
            title.textColor = .black
        }
        let description = UILabel().then { des in
            des.text = "#해피홀리룩챌린지"
            des.font = .systemFont(ofSize: 13, weight: .light)
            des.textColor = UIColor(red: 135/255, green: 135/255, blue: 135/255, alpha: 1)
        }
        $0.addArrangedSubview(title)
        $0.addArrangedSubview(description)
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 7
    }
    
    let challengeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({
        $0.estimatedItemSize = .init(width: 124, height: 165)
        $0.minimumLineSpacing = 7
        $0.scrollDirection = .horizontal
    })).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(ChallengeCollectionViewCell.self, forCellWithReuseIdentifier: ChallengeCollectionViewCell.identifier)
        $0.showsHorizontalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    
    
    private func setUpView() {
        addSubview(segmentedControl)
        addSubview(underBar)
        addSubview(scrollView)
        
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(mainImage)
        contentView.addSubview(menuCollectionView)
        contentView.addSubview(divider1)
        contentView.addSubview(justDroppedStack)
        contentView.addSubview(justDroppedCollectionView)
        contentView.addSubview(divider2)
        contentView.addSubview(challengeStack)
        contentView.addSubview(challengeCollectionView)
        
    }
    
    private func setUpConstraints() {
        segmentedControl.snp.makeConstraints {
            $0.horizontalEdges.equalTo(safeAreaLayoutGuide)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(35)
        }
        
        underBar.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.width.equalTo(30)
            $0.bottom.equalTo(segmentedControl.snp.bottom)
            $0.leading.equalToSuperview().inset(13)
        }
        
        scrollView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(safeAreaLayoutGuide)
            $0.top.equalTo(segmentedControl.snp.bottom)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        
        mainImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(349)
            $0.height.equalTo(182)
        }
        
        divider1.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(menuCollectionView.snp.bottom).offset(25)
            $0.height.equalTo(1)
        }
        
        justDroppedStack.snp.makeConstraints {
            $0.top.equalTo(divider1.snp.bottom).offset(17)
            $0.leading.equalToSuperview().inset(15)
        }
        
        justDroppedCollectionView.snp.makeConstraints {
            $0.top.equalTo(justDroppedStack.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(237)
        }
        
        divider2.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(justDroppedCollectionView.snp.bottom).offset(25)
            $0.height.equalTo(1)
        }
        
        challengeStack.snp.makeConstraints {
            $0.top.equalTo(divider2.snp.bottom).offset(17)
            $0.leading.equalToSuperview().inset(15)
        }
        
        challengeCollectionView.snp.makeConstraints {
            $0.top.equalTo(challengeStack.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(165) // estimatedItemSize를 설정해줬음에도 불구하고 필요
            $0.bottom.equalToSuperview().inset(20)
        }
        
    }
    


}








extension UIImage {

    convenience init(color: UIColor, size: CGSize) {

        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        color.set()
        let context = UIGraphicsGetCurrentContext()!
        context.fill(CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.init(data: image.pngData()!)!
    }
}

