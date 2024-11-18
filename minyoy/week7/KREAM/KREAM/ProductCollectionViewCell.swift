//
//  ProductCollectionViewCell.swift
//  KREAM
//
//  Created by 주민영 on 11/4/24.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public let image = UIImageView().then {
        $0.image = UIImage(named: "collection_image_5")
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    public let transaction = UILabel().then {
        $0.text = "거래 12.8만"
        $0.textColor = .black
        $0.textAlignment = .right
        $0.font = .systemFont(ofSize: 10, weight: .light)
    }
    
    public let saved = UIButton().then {
        $0.backgroundColor = .clear
        $0.setImage(.iconSaved, for: .normal)
        $0.addTarget(self, action: #selector(savedBtnTap), for: .touchUpInside)
    }
    
    @objc private func savedBtnTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if sender.isSelected {
            sender.setImage(.iconSavedFill, for: .normal)
        } else {
            sender.setImage(.iconSaved, for: .normal)
        }
    }
    
    public let brand = UILabel().then {
        $0.text = "MLB"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    
    public let product = UILabel().then {
        $0.text = "청키라이너 뉴욕양키스"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.numberOfLines = 2
    }
    
    public let price = UILabel().then {
        $0.text = "139,000원"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
    }
    
    private let instant = UILabel().then {
        $0.text = "즉시 구매가"
        $0.textColor = .gray
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 10, weight: .light)
    }
    
    private func setupView() {
        addSubview(image)
        addSubview(transaction)
        addSubview(saved)
        addSubview(brand)
        addSubview(product)
        addSubview(price)
        addSubview(instant)
        
        image.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.width.height.equalTo(142)
        }
        
        transaction.snp.makeConstraints {
            $0.top.equalTo(image.snp.top).inset(8)
            $0.trailing.equalTo(image.snp.trailing).inset(8)
        }
        
        saved.snp.makeConstraints {
            $0.bottom.equalTo(image.snp.bottom).inset(10)
            $0.trailing.equalTo(image.snp.trailing).inset(10)
            $0.width.equalTo(22)
            $0.height.equalTo(20)
        }
        
        brand.snp.makeConstraints {
            $0.top.equalTo(image.snp.bottom).offset(8)
            $0.leading.equalTo(image.snp.leading).offset(4)
        }
        
        product.snp.makeConstraints {
            $0.top.equalTo(brand.snp.bottom).offset(3)
            $0.leading.equalTo(brand.snp.leading)
            $0.width.equalTo(image)
        }
        
        price.snp.makeConstraints {
            $0.bottom.equalTo(instant.snp.top).offset(-2)
            $0.leading.equalTo(brand.snp.leading)
        }
        
        instant.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(brand.snp.leading)
        }
    }
}
