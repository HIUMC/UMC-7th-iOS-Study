//
//  HOMEView.swift
//  Kream
//
//  Created by KoNangYeon on 10/31/24.
//

import UIKit
import Then
import SnapKit

class HOMEView: UIView {
    
    private var segmentWidth: [CGFloat] = []
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
        setupContentViews()
        
        self.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var scrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        //$0.contentSize = CGSize(width: self.frame.size.width, height: 5000)
    }
    
    private lazy var bellBtn = UIButton().then {
        $0.setImage(UIImage(named: "icon_alert_none"), for: .normal)
    }
    
    lazy var searchBar = UITextField().then{
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.font = UIFont.systemFont(ofSize: 13.5, weight: .regular)
        $0.layer.cornerRadius = 12
        $0.layer.backgroundColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 96/100, alpha: 1.0).cgColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        $0.leftViewMode = .always
    }
    
    let segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then{
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.apportionsSegmentWidthsByContent = true //아이템 폭이 내용에 맞춰 자동 조절
        $0.selectedSegmentIndex = 0 //앱 실행됐을때 선택할 인덱t=스
        
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
    
    let line = UIView().then {
        $0.backgroundColor = .black
    }
    
    let HOMECollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumInteritemSpacing = 9
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(HOMECollectionViewCell.self, forCellWithReuseIdentifier: HOMECollectionViewCell.identifier)
    }
    
    let mainImage = UIImageView().then{
        $0.image = UIImage(named: "image_ad_none")
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var divideLine = UIView().then{
        $0.backgroundColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 94/100, alpha: 1.0)
    }
    
    private lazy var dropTitle = UILabel().then {
        $0.text = "Just Dropped"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    private lazy var dropSmallTitle = UILabel().then {
        $0.text = "발매 상품"
        $0.textColor = UIColor(hue: 0, saturation: 0, brightness: 0.52, alpha: 1.0)
        $0.font = UIFont.systemFont(ofSize: 13, weight: .light)
    }
    
    let HOMECollectionView2 = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 142, height: 237)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.isScrollEnabled = true
        $0.allowsSelection = true
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.register(HOMECollectionViewCell2.self, forCellWithReuseIdentifier: HOMECollectionViewCell2.identifier)
    }
    
    lazy var divideLine2 = UIView().then{
        $0.backgroundColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 94/100, alpha: 1.0)
    }
    
    private lazy var dropTitle2 = UILabel().then {
        $0.text = "본격 한파대비! 연말 필수템 모음"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    private lazy var dropSmallTitle2 = UILabel().then {
        $0.text = "#해피홀리룩챌린지"
        $0.textColor = UIColor(hue: 0, saturation: 0, brightness: 0.52, alpha: 1.0)
        $0.font = UIFont.systemFont(ofSize: 13, weight: .light)
    }
    
    lazy var HOMECollectionView3 = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 124, height: 165)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.register(HOMECollectionViewCell3.self, forCellWithReuseIdentifier: HOMECollectionViewCell3.identifier)
    }
    
    lazy var contentView = UIView()
    lazy var topView = UIView()//top이랑 bottom나눠서 뷰컨에서 hidden할때도...
    lazy var bottomView = UIView()
    
    private func setupView(){
        self.addSubview(scrollView)
        
        scrollView.snp.makeConstraints{
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(contentView)
        
        contentView.snp.makeConstraints{
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView.snp.width) // 가로 스크롤을 방지하고 스크롤뷰와 같은 너비로 설정
            $0.height.equalTo(1300)
        }
        
        contentView.addSubview(topView)
        contentView.addSubview(bottomView)
        
        topView.snp.makeConstraints{
            $0.top.equalTo(contentView)
            $0.horizontalEdges.equalTo(contentView)
            $0.width.equalTo(contentView.snp.width)
            $0.height.equalTo(90)//top bottom 높이 설정해줬더니 가로스크롤됨
        }
        
        bottomView.snp.makeConstraints{
            $0.top.equalTo(topView.snp.bottom)
            $0.horizontalEdges.equalTo(contentView)
            $0.width.equalTo(contentView.snp.width)
            $0.height.equalTo(contentView.snp.height)
        }
    }
    
    private func setupContentViews() {
        [
            bellBtn,
            searchBar,
            segmentedControl,
            line
        ].forEach{
            topView.addSubview($0)
        }
        
        [   mainImage,
            HOMECollectionView,
            divideLine,
            dropTitle,
            dropSmallTitle,
            HOMECollectionView2,
            divideLine2,
            dropTitle2,
            dropSmallTitle2,
            HOMECollectionView3
        ].forEach{
            bottomView.addSubview($0)
        }
        
        bellBtn.snp.makeConstraints{
            $0.top.equalTo(scrollView.snp.top).inset(16.25)
            $0.right.equalTo(safeAreaLayoutGuide).inset(16)
            $0.height.width.equalTo(24)
        }
        
        searchBar.snp.makeConstraints{
            $0.top.equalTo(scrollView.snp.top).inset(6)
            $0.left.equalTo(safeAreaLayoutGuide).inset(16)
            $0.right.equalTo(bellBtn.snp.left).offset(-16)
            $0.height.equalTo(40)
        }
        
        segmentedControl.snp.makeConstraints{
            $0.top.equalTo(searchBar.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(27)
        }
        
        line.snp.makeConstraints{
            segmentedControl.layoutIfNeeded()
            
            $0.top.equalTo(segmentedControl.snp.bottom).offset(8)
            $0.height.equalTo(2)
            
            if let selectedSegmentFrame = segmentedControl.subviews.first?.frame { $0.leading.equalTo(segmentedControl).offset(selectedSegmentFrame.minX + 7.9)
                $0.width.equalTo(selectedSegmentFrame.width * 0.75)
            }
        }
            
            
        mainImage.snp.makeConstraints{
            $0.top.equalTo(line.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview()
        }
            
        HOMECollectionView.snp.makeConstraints{
            $0.top.equalTo(mainImage.snp.bottom).offset(20)
            $0.left.equalTo(contentView).inset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(182)
        }
            
        divideLine.snp.makeConstraints{
            $0.top.equalTo(HOMECollectionView.snp.bottom).offset(30)
            $0.horizontalEdges.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(1)
        }
            
        dropTitle.snp.makeConstraints{
            $0.top.equalTo(divideLine.snp.bottom).offset(20)
            $0.left.equalTo(safeAreaLayoutGuide).inset(16)
        }
            
        dropSmallTitle.snp.makeConstraints{
            $0.top.equalTo(dropTitle.snp.bottom).offset(4)
            $0.left.equalTo(safeAreaLayoutGuide).inset(16)
        }
            
        HOMECollectionView2.snp.makeConstraints{
            $0.top.equalTo(dropSmallTitle.snp.bottom).offset(14)
            $0.left.equalTo(safeAreaLayoutGuide).inset(16)
            $0.right.equalTo(safeAreaLayoutGuide)//가로길이 너무 크면 스크롤안됨
            $0.height.equalTo(237)
        }
            
        divideLine2.snp.makeConstraints{
            $0.top.equalTo(HOMECollectionView2.snp.bottom).offset(30)
            $0.horizontalEdges.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(1)
        }
            
        dropTitle2.snp.makeConstraints{
            $0.top.equalTo(divideLine2.snp.bottom).offset(20)
            $0.left.equalTo(safeAreaLayoutGuide).inset(16)
        }
            
        dropSmallTitle2.snp.makeConstraints{
            $0.top.equalTo(dropTitle2.snp.bottom).offset(4)
            $0.left.equalTo(safeAreaLayoutGuide).inset(16)
        }
            
        HOMECollectionView3.snp.makeConstraints{
            $0.top.equalTo(dropSmallTitle2.snp.bottom).offset(14)
            $0.left.equalTo(safeAreaLayoutGuide).inset(16)
            $0.right.equalTo(safeAreaLayoutGuide)//가로길이 너무 크면 스크롤안됨
            $0.height.equalTo(165)
        }
    }
}

/// 홈 뷰컨트롤러 내부 세그먼트 컨트롤러
class HomeSegmentControl: UISegmentedControl {
    
    /// 세그먼트 컨트롤러가 가지는 하단 막대 커스텀을 위한 UIView 생성
    let selectedIndicator = UIView()
    
    // MARK: - Init
    
    init(items: [String]) {
        super.init(items: items)
        configureSegmentControl()
        selectedSegmentIndicator()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateIndicatorPosition(animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - selfSetup Function
    
    /// 세그먼트 컨트롤 커스텀
    private func configureSegmentControl() {
        self.backgroundColor = UIColor.clear
        self.selectedSegmentTintColor = UIColor.clear
        
        
        /* 경계선 및 뒷 배경 제거*/
        let clearImage = UIImage()
        setBackgroundImage(clearImage, for: .normal, barMetrics: .default)
        setBackgroundImage(clearImage, for: .selected, barMetrics: .default)
        setDividerImage(clearImage, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        /* 세그먼트 선택되었을 때 폰트 값 */
        let selectedAttributes = makeAttributes(color: UIColor.black, weight: .bold)
        
        /* 세그먼트 선택되지 않은 상태 폰트 값*/
        let normalAttributes = makeAttributes(color: UIColor.darkGray, weight: .regular)
        
        /* 세그먼트 선택되었을 때 폰트 설정 */
        setTitleTextAttributes(selectedAttributes, for: .selected)
        
        /* 세그먼트 기본 상태 폰트 설정 */
        setTitleTextAttributes(normalAttributes, for: .normal)
        
        /* 세그먼트 버튼 클릭 시 변화 */
        addTarget(self, action: #selector(segmentChange), for: .valueChanged)
    }
    
    // MARK: - MakeFunction
    
    /// 세그먼트 글자 커스텀 지정
    /// - Parameter weight: 굵기 조정
    /// - Returns: 지정된 폰트 스타일 반환
    private func makeAttributes(color: UIColor, weight: UIFont.Weight) -> [NSAttributedString.Key: Any] {
        var value = [NSAttributedString.Key: Any]()
        value[.foregroundColor] = color
        value[.font] = UIFont.systemFont(ofSize: 16, weight: weight)
        return value
    }
}

//MARK: - SegmentExtension

extension HomeSegmentControl {
    // MARK: - IndicatorFunction
    
    /// 세그먼트 막대 추가
    private func selectedSegmentIndicator() {
        selectedIndicator.backgroundColor = UIColor.black
        selectedSegmentIndex = 0
        addSubview(selectedIndicator)
        
        /*
         처음 등장하는 시점에서는 애니메이션이 필요가 없습니다.
         뷰 컨트롤러가 바로 띄워지는 시점이기 때문에 세그먼트가 선택된 상태로 바로 등장해야 합니다.
         그래서 animation값은 false로 지정합니다.
         */
        updateIndicatorPosition(animated: false)
    }
    
    /// 세그먼트 막대 포지션 이동 설정
    /// - Parameter animated: 애니메이션 유/무 설정
    private func updateIndicatorPosition(animated: Bool) {
        let segmentWidth = bounds.width / CGFloat(numberOfSegments)
        
        /* 세그먼트 인디케이터와 세그먼트 텍스트 중간 정렬을 위한 여백 값 */
        let leftOffset: CGFloat = 1
        
        /* 선택된 세그먼트의 텍스트 길이에 맞춰 막대의 가로 길이 설정 */
        let indicatorWidth = calculateLabelWidth(for: selectedSegmentIndex)
        
        let indicatorPositionX = segmentWidth * CGFloat(selectedSegmentIndex) + (segmentWidth - indicatorWidth) / 2 - leftOffset
        let indicatorFrame = CGRect(x: indicatorPositionX, y: bounds.height - 3, width: indicatorWidth, height: 2)
        
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                self.selectedIndicator.frame = indicatorFrame
            })
        } else {
            self.selectedIndicator.frame = indicatorFrame
        }
    }
    
    /// 각 세그먼트 버튼 위치의 텍스트 사이즈 계산
    /// - Parameter index: 현재 선택된 세그먼트 버튼
    /// - Returns: 선택된 세그먼트 텍스트 사이즈 값 반환
    private func calculateLabelWidth(for index: Int) -> CGFloat {
           guard let title = titleForSegment(at: index) else { return 0 }
           let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 16, weight: .bold)]
           let textSize = (title as NSString).size(withAttributes: attributes)
           return textSize.width
       }
    
    @objc private func segmentChange() {
        updateIndicatorPosition(animated: true)
    }
}
