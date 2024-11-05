//
//  ReleasedCollectionViewCell.swift
//  KREAM
//
//  Created by 이태림 on 11/4/24.
//

import UIKit
import SnapKit
import Then

class ReleasedCollectionViewCell: UICollectionViewCell {
    static let identifier = "ReleasedCollectionViewCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageview = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
    
    let volumeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .light)
        $0.textColor = .black
        $0.text = "거래 12.8만"
        $0.numberOfLines = 0
    }
    
    private lazy var savedScrapButton = UIButton().then {
        $0.setImage(UIImage(systemName: "_icon_saved_none"), for: .normal)
    }
    
    let brandLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        $0.textColor = .black
        $0.text = "MLB"
        $0.numberOfLines = 0
    }
    
    let productLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
        $0.text = "청키라이너 뉴욕양키스"
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }
    
    let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .bold)
        $0.textColor = .black
        $0.text = "139,000원"
        $0.numberOfLines = 0
    }
    
    let rightbuyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .medium)
        $0.textColor = UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1.00)
        $0.text = "즉시 구매가"
        $0.numberOfLines = 0
    }
    
    private func setViews() {
        addSubview(imageview)
        addSubview(volumeLabel)
        addSubview(savedScrapButton)
        addSubview(brandLabel)
        addSubview(productLabel)
        addSubview(priceLabel)
        addSubview(rightbuyLabel)
    }
    
    private func setConstaints() {
        
        imageview.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(142)
        }
        
        volumeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(80)
            $0.trailing.equalToSuperview().offset(-8)
            $0.height.equalTo(12)
        }
        
        savedScrapButton.snp.makeConstraints {
            $0.top.equalTo(volumeLabel.snp.bottom).offset(92)
            $0.leading.equalToSuperview().offset(110)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(20)
            $0.width.equalTo(22)
        }
        
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(imageview.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(4)
            $0.height.equalTo(14)
        }
        
        productLabel.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().offset(4)
            $0.height.equalTo(28)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(productLabel.snp.bottom).offset(26)
            $0.leading.equalToSuperview().offset(4)
            $0.height.equalTo(16)
        }
        
        rightbuyLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(4)
            $0.height.equalTo(12)
            $0.bottom.equalToSuperview()
        }
    }
    
    public func releasedconfigure(model: ReleasedModel) {
        self.imageview.image = UIImage(named: model.image)
        self.volumeLabel.text = model.volumename
        self.savedScrapButton.setImage(UIImage(named: model.savedimage), for: .normal)
        self.brandLabel.text = model.brandname
        self.productLabel.text = model.productname
        self.priceLabel.text = model.pricename
        self.rightbuyLabel.text = model.rightbuyname
    }
    
}
