//
//  purchaseView.swift
//  Kream
//
//  Created by KoNangYeon on 11/10/24.
//

import UIKit
import Then
import SnapKit
    

class purchaseView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addStack()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let productDetailedView = ProductDetailedView()
    
    lazy var backBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "multiply"), for: .normal)
        $0.tintColor = .black
    }
    
    private lazy var text1 = Label(title: "구매하기", size: 15, weight: .bold)
    
    private lazy var text2 = Label(title: "(가격 단위: 원)", size: 10, weight: .regular, color: UIColor(hexCode: "929292"))
    
    private lazy var image = UIImageView().then {
        $0.image = productDetailedView.mainImage.image
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    private lazy var text3 = Label(title: productDetailedView.text3.text, size: 14, weight: .regular)
    
    private lazy var text4 = productDetailedView.text4
    
    public lazy var purchaseCollectionView = UICollectionView(frame: frame, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 110, height: 47)
        $0.minimumInteritemSpacing = 7
    }).then {
        $0.isScrollEnabled = false
        $0.backgroundColor = .clear
        $0.register(purchaseViewCell.self, forCellWithReuseIdentifier: purchaseViewCell.identifier)
    }
    
    //구매, 판매 버튼 만드는 함수
    private func creatBtn(
        title: String, subtitle: String, subtitleColor: UIColor,
        backgroundColor: UIColor
    ) -> UIButton {
        return UIButton().then {
            var config = UIButton.Configuration.plain()
            
            $0.backgroundColor = backgroundColor
            $0.layer.cornerRadius = 10
            
            config.attributedTitle = AttributedString(title, attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 14, weight: .semibold), .foregroundColor: UIColor(.white)]))
            config.titleAlignment = .center
            
            config.attributedSubtitle = AttributedString(subtitle, attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 10, weight: .regular), .foregroundColor: subtitleColor]))
            config.titlePadding = 0
            
            config.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 0, bottom: 12, trailing: 0)
            
            $0.configuration = config
        }
    }
        
    //구매 버튼
    private lazy var purchaseBtn = creatBtn(title: "345,000", subtitle: "빠른배송(1-2일 소요)", subtitleColor: UIColor(hexCode: "FFCAB9"), backgroundColor: UIColor(hexCode: "EF6254"))
       
    //판매 버튼
    private lazy var saleBtn = creatBtn(title: "407,000", subtitle: "빠른배송(1-2일 소요)", subtitleColor: UIColor(hexCode: "E2E2E2"), backgroundColor: UIColor(hexCode: "222222"))
      
    //라인
    private lazy var line = UIView().then {
        $0.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.9, alpha: 1.0)
    }
    
    //버튼 담는 스택뷰
    //alignment = .leading으로 해줘야 뭔가 맞음..(초기값으로 설정해놨음)
    private let stackView = Stack(axis: .horizontal, spacing: 6, distribution: .fillProportionally)
    
    private func addStack() {
        [purchaseBtn, saleBtn].forEach{stackView.addArrangedSubview($0)}
    }
        
    private func setupView() {
        [
            backBtn,
            text1,
            text2,
            image,
            text3,
            text4,
            purchaseCollectionView,
            line,
            stackView,
        ].forEach{
            addSubview($0)
        }
            
        backBtn.snp.makeConstraints{
            $0.top.equalToSuperview().inset(20)
            $0.right.equalToSuperview().inset(16)
            $0.width.height.equalTo(20)
        }
            
        text1.snp.makeConstraints{
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
            
        text2.snp.makeConstraints{
            $0.top.equalTo(text1.snp.bottom)
            $0.centerX.equalToSuperview()
        }
            
        image.snp.makeConstraints{
            $0.top.equalTo(text2.snp.bottom).offset(11)
            $0.left.equalToSuperview().inset(16)
            $0.width.height.equalTo(91)
        }
            
        text3.snp.makeConstraints{
            $0.top.equalTo(text2.snp.bottom).offset(29)
            $0.left.equalTo(image.snp.right).offset(15)
        }
            
        text4.snp.makeConstraints{
            $0.top.equalTo(text3.snp.bottom).offset(4)
            $0.left.equalTo(image.snp.right).offset(15)
        }
            
        purchaseCollectionView.snp.makeConstraints{
            $0.top.equalTo(image.snp.bottom).offset(35)
            $0.left.equalToSuperview().inset(15)
            $0.width.equalTo(344)
            $0.height.equalTo(110)
        }
            
        line.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.bottom.equalTo(stackView.snp.top).offset(-10)
            $0.horizontalEdges.equalToSuperview()
        }

        stackView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(91)
        }
    }
}
