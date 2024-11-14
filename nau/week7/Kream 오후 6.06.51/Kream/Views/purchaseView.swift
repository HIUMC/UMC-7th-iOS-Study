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
    
    private lazy var text1 = UILabel().then {
        $0.text = "구매하기"
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .black
    }
    
    private lazy var text2 = UILabel().then {
        $0.text = "(가격 단위: 원)"
        $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        $0.textColor = UIColor(hue: 0, saturation: 0, brightness: 0.57, alpha: 1.0)
    }
    
    private lazy var image = UIImageView().then {
        $0.image = productDetailedView.mainImage.image
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    private lazy var text3 = UILabel().then {
        $0.text = productDetailedView.text3.text
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .black
    }
    
    private lazy var text4 = productDetailedView.text4
    
    lazy var purchaseCollectionView = UICollectionView(frame: frame, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 110, height: 47)
        $0.minimumInteritemSpacing = 7
    }).then {
        $0.isScrollEnabled = false
        $0.backgroundColor = .clear
        $0.register(purchaseViewCell.self, forCellWithReuseIdentifier: purchaseViewCell.identifier)
    }
    
    private lazy var purchaseBtn = UIButton().then {
        var config = UIButton.Configuration.plain()
        $0.backgroundColor = UIColor(hue: 0.0139, saturation: 0.64, brightness: 0.93, alpha: 1.0)
        $0.layer.cornerRadius = 10
        
        config.attributedTitle = AttributedString("345,000", attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 14, weight: .semibold), .foregroundColor: UIColor(.white)]))
        config.titleAlignment = .center
        
        config.attributedSubtitle = AttributedString("빠른배송(1-2일 소요)", attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 10, weight: .regular), .foregroundColor: UIColor(hue: 0.0389, saturation: 0.27, brightness: 1, alpha: 1.0)]))
        config.titlePadding = 0
        
        config.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 0, bottom: 12, trailing: 0)
        
        $0.configuration = config
    }
    
    private lazy var saleBtn = UIButton().then {
        var config = UIButton.Configuration.plain()
        $0.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.13, alpha: 1.0)
        $0.layer.cornerRadius = 10
        
        config.attributedTitle = AttributedString("407,000", attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 14, weight: .semibold), .foregroundColor: UIColor(.white)]))
        config.titleAlignment = .center
        
        config.attributedSubtitle = AttributedString("빠른배송(1-2일 소요)", attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 10, weight: .regular), .foregroundColor: UIColor(hue: 0, saturation: 0, brightness: 0.88, alpha: 1.0)]))
        config.titlePadding = 0
        
        config.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 0, bottom: 12, trailing: 0)
        
        $0.configuration = config
    }
    
    private lazy var line = UIView().then {
        $0.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.9, alpha: 1.0)
    }
    
    public lazy var CustomtabBar = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let stackView = UIStackView()

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
        
        stackView.addArrangedSubview(purchaseBtn)
        stackView.addArrangedSubview(saleBtn)
        
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        
        stackView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(91)
        }
    }
}
