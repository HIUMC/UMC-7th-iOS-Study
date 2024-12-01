//
//  ProductDetailedView.swift
//  Kream
//
//  Created by KoNangYeon on 11/9/24.
//

import UIKit
import Then
import SnapKit

class ProductDetailedView: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addStack()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var mainImage = UIImageView().then {
        $0.image = UIImage(named: "image-19")
    }
    
    public lazy var backBtn = BasicButton().then {
        $0.config(title: nil, image: UIImage(named: "icon_arrow_back.png"))
    }
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 53, height: 53)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(ProductDetailedViewCell.self, forCellWithReuseIdentifier: ProductDetailedViewCell.identifier)
    }
    
    private lazy var text1 = Label(title: "즉시 구매가", size: 12, weight: .light)

    private lazy var text2 = Label(title: "228,000원", size: 20, weight: .semibold)
    
    lazy var text3 = Label(title: "Matin Kim Logo Coating Jumper", size: 16, weight: .regular)
    
    lazy var text4 = Label(title: "마뗑킴 로고 코팅 점퍼 블랙", size: 12, weight: .regular, color: UIColor(hue: 0, saturation: 0, brightness: 0.61, alpha: 1.0))
    
    public lazy var savedBtn = UIButton().then {
        var config = UIButton.Configuration.plain()
        $0.setImage(.notsaved, for: .normal)
        config.imagePlacement = .top
        config.attributedTitle = AttributedString("2,122", attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 12, weight: .regular)]))
        config.baseForegroundColor = .black
        config.contentInsets = NSDirectionalEdgeInsets(top: 3.71, leading: 0, bottom: 0, trailing: 0)
        config.baseBackgroundColor = .clear
      
        $0.configuration = config
    }
    
    
    public lazy var purchaseBtn = CustomButton().then {
        $0.setTexts(title: "구매", subtitle: "345,000", extra: "즉시 구매가")
        $0.backgroundColor = UIColor(hue: 0.0139, saturation: 0.64, brightness: 0.93, alpha: 1.0)
        $0.extraText.textColor = UIColor(hue: 0.025, saturation: 0.78, brightness: 0.63, alpha: 1.0)
    }
    
    public lazy var saleBtn = CustomButton().then {
        $0.setTexts(title: "판매", subtitle: "396,000", extra: "즉시 판매가")
        $0.backgroundColor = UIColor(hue: 0.4111, saturation: 0.64, brightness: 0.72, alpha: 1.0)
        $0.extraText.textColor = UIColor(hue: 0.4028, saturation: 0.73, brightness: 0.46, alpha: 1.0)
    }
    
    private lazy var line = UIView().then {
        $0.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.9, alpha: 1.0)
    }
    
    private lazy var stack = Stack(axis: .horizontal, spacing: 8)
    
    private func addStack() {
        [savedBtn, purchaseBtn, saleBtn].forEach{stack.addArrangedSubview($0)}
    }
    
    private func setupView() {
        [
            backBtn,
            mainImage,
            collectionView,
            text1,
            text2,
            text3,
            text4,
            stack,
            line
        ].forEach{
            addSubview($0)
        }
        
        backBtn.snp.makeConstraints{
            $0.top.equalTo(safeAreaLayoutGuide).inset(14)
            $0.left.equalTo(safeAreaLayoutGuide).inset(15)
        }
        
        mainImage.snp.makeConstraints{
            $0.top.equalTo(backBtn.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(safeAreaLayoutGuide)
        }
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(mainImage.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(53)
        }
        
        text1.snp.makeConstraints{
            $0.top.equalTo(collectionView.snp.bottom).offset(23)
            $0.left.equalTo(safeAreaLayoutGuide).inset(16)
        }
        
        text2.snp.makeConstraints{
            $0.top.equalTo(text1.snp.bottom).offset(4)
            $0.left.equalTo(safeAreaLayoutGuide).inset(16)
        }
        
        text3.snp.makeConstraints{
            $0.top.equalTo(text2.snp.bottom).offset(18)
            $0.left.equalTo(safeAreaLayoutGuide).inset(16)
        }
        
        text4.snp.makeConstraints{
            $0.top.equalTo(text3.snp.bottom).offset(6)
            $0.left.equalTo(safeAreaLayoutGuide).inset(16)
        }
        
        stack.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(90)
        }
        
        line.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.bottom.equalTo(stack.snp.top).offset(-8)
            $0.horizontalEdges.equalToSuperview()
        }
        
        savedBtn.snp.makeConstraints{
            $0.width.lessThanOrEqualTo(35)
        }
        
        purchaseBtn.snp.makeConstraints{
            $0.width.equalTo(saleBtn.snp.width)
            $0.height.greaterThanOrEqualTo(45)
        }
        
        saleBtn.snp.makeConstraints{
            $0.height.equalTo(purchaseBtn.snp.height)
        }
    }
}

class CustomButton: UIButton {
    let subtitleText = UILabel()
    let extraText = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        self.titleLabel!.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        self.titleLabel!.textAlignment = .left
        self.titleLabel!.textColor = .white
        
        // 서브타이틀 설정
        subtitleText.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        subtitleText.textAlignment = .left
        subtitleText.textColor = .white
        
        // 추가 라벨 설정
        extraText.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        extraText.textAlignment = .left

        // 레이블을 버튼에 추가
        addSubview(subtitleText)
        addSubview(extraText)
        
        titleLabel?.snp.makeConstraints{
            $0.left.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
        
        subtitleText.snp.makeConstraints{
            $0.top.equalToSuperview().inset(8)
            $0.left.equalToSuperview().inset(59)
        }
        
        extraText.snp.makeConstraints{
            $0.top.equalTo(subtitleText.snp.bottom).offset(2)
            $0.left.equalToSuperview().inset(59)
        }
        
    }
    
    func setTexts(title: String, subtitle: String, extra: String) {
        self.setTitle(title, for: .normal)
        self.subtitleText.text = subtitle
        self.extraText.text = extra
    }
}
