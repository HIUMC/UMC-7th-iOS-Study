//
//  JustDroppedCollectionViewCell.swift
//  cloneKream
//
//  Created by 김서현 on 11/3/24.
//

import UIKit

class JustDroppedCollectionViewCell: UICollectionViewCell {
    static let identifier = "JustDroppedCollectionViewCell"
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
    
    let brandLabel = UILabel().then {
        $0.text = "MLB"
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .black
    }
    
    let productLabel = UILabel().then {
        $0.text = "청키라이너 뉴욕양키스"
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    private lazy var productStack = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.addArrangedSubview(brandLabel)
        $0.addArrangedSubview(productLabel)
        $0.spacing = 3
    }
    
    let priceLabel = UILabel().then {
        $0.text = "139,000원"
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
        $0.textColor = .black
    }
    
    let stateLabel = UILabel().then {
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 10, weight: .light)
        $0.textColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1)
    }
    
    private lazy var priceStack = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.addArrangedSubview(priceLabel)
        $0.addArrangedSubview(stateLabel)
        $0.spacing = 2
    }
    
    let savedButton = UIButton().then {
        $0.setImage(.jdSaved, for: .normal)
        $0.setImage(.jdSavedFill, for: .selected)
    }
    
    let tradingLabel = UILabel().then {
        $0.text = "거래 12.8만"
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = UIColor(red: 64/255, green: 69/255, blue: 75/244, alpha: 1)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        addSubview(imageView)
        addSubview(productStack)
        addSubview(priceStack)
        addSubview(savedButton)
        addSubview(tradingLabel)
        
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.width.height.equalTo(142)
        }
        
        productStack.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(5)
            $0.trailing.equalToSuperview().inset(5)
        }
        
        priceStack.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(5)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        savedButton.snp.makeConstraints {
            $0.width.height.equalTo(20)
            $0.trailing.equalTo(imageView.snp.trailing).offset(-10)
            $0.bottom.equalTo(imageView.snp.bottom).offset(-10)
        }
        
        tradingLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top).offset(10)
            $0.trailing.equalTo(imageView.snp.trailing).offset(-10)
        }
    }
    
    public func loadImage(from url: String) {
        if let imageURL = URL(string: url) {
            imageView.kf.setImage(with: imageURL)
        }
    }

}



   
    
    
    

    
    

        

