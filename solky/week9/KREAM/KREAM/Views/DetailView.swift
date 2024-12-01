//
//  DetailView.swift
//  KREAM
//
//  Created by 이태림 on 11/11/24.
//

import UIKit
import SnapKit
import Then

class DetailView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var productimage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    public func loadImage(from url: String) {
        if let imageURL = URL(string: url) {
            productimage.kf.setImage(with: imageURL)
        }
    }
    
    public lazy var DetailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 53, height: 53)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
    }
    
    public lazy var nowbuyLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .light)
    }
    
    public lazy var detailpriceLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.numberOfLines = 0
    }
    
    public lazy var detailproductLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    public lazy var koreanproductLabel = UILabel().then {
        $0.textColor = UIColor(red: 0.61, green: 0.61, blue: 0.61, alpha: 1.00)
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    public lazy var separateview = UIView().then {
        $0.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
    }
    
    public lazy var detailscrapimage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    public lazy var scrapmountLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "2,122"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    public lazy var buybutton = UIButton().then {
        $0.backgroundColor = UIColor(red: 0.94, green: 0.38, blue: 0.33, alpha: 1.00)
        $0.layer.cornerRadius = 10
        
        let purchaseLabel = UILabel().then {
            $0.text = "구매"
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
            $0.textColor = .white
        }
        
        let priceLabel = UILabel().then {
            $0.text = "345,000"
            $0.font = .systemFont(ofSize: 13, weight: .semibold)
            $0.textColor = .white
        }
        
        let rightpurchaseLabel = UILabel().then {
            $0.text = "즉시 구매가"
            $0.font = .systemFont(ofSize: 10, weight: .regular)
            $0.textColor = UIColor(red: 0.64, green: 0.22, blue: 0.14, alpha: 1.00)
        }
        
        $0.addSubview(purchaseLabel)
        $0.addSubview(priceLabel)
        $0.addSubview(rightpurchaseLabel)
        
        purchaseLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(19)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalTo(purchaseLabel.snp.trailing).offset(21)
            
        }
        
        rightpurchaseLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-11)
            $0.top.equalTo(priceLabel.snp.bottom).offset(2)
            $0.leading.equalTo(purchaseLabel.snp.trailing).offset(21)
            $0.trailing.equalToSuperview().offset(-38)
        }
    }
    
    public lazy var sellbutton = UIButton().then {
        $0.backgroundColor = UIColor(red: 0.25, green: 0.73, blue: 0.48, alpha: 1.00)
        $0.layer.cornerRadius = 10
        
        let sellLabel = UILabel().then {
            $0.text = "판매"
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
            $0.textColor = .white
        }
        
        let priceLabel = UILabel().then {
            $0.text = "396,000"
            $0.font = .systemFont(ofSize: 13, weight: .semibold)
            $0.textColor = .white
        }
        
        let rightsellLabel = UILabel().then {
            $0.text = "즉시 판매가"
            $0.font = .systemFont(ofSize: 10, weight: .regular)
            $0.textColor = UIColor(red: 0.12, green: 0.47, blue: 0.27, alpha: 1.00)
        }
        
        $0.addSubview(sellLabel)
        $0.addSubview(priceLabel)
        $0.addSubview(rightsellLabel)
        
        sellLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(19)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalTo(sellLabel.snp.trailing).offset(21)
            
        }
        
        rightsellLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-11)
            $0.top.equalTo(priceLabel.snp.bottom).offset(2)
            $0.leading.equalTo(sellLabel.snp.trailing).offset(21)
            $0.trailing.equalToSuperview().offset(-38)
        }
    }
    
    private func setViews() {
        self.addSubview(productimage)
        self.addSubview(DetailCollectionView)
        self.addSubview(nowbuyLabel)
        self.addSubview(detailpriceLabel)
        self.addSubview(detailproductLabel)
        self.addSubview(koreanproductLabel)
        self.addSubview(detailscrapimage)
        self.addSubview(scrapmountLabel)
        self.addSubview(buybutton)
        self.addSubview(sellbutton)
        self.addSubview(separateview)
        
        detailscrapimage.image = UIImage(named: "_icon_saved_none")
    }
  
    
    private func setConstraints() {
        
        productimage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(96)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(373)
        }
        
       DetailCollectionView.snp.makeConstraints {
            $0.top.equalTo(productimage.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(53)
            $0.width.equalTo(419)
        }
        
       nowbuyLabel.snp.makeConstraints {
            $0.top.equalTo(DetailCollectionView.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(14)
        }
        
       detailpriceLabel.snp.makeConstraints {
            $0.top.equalTo(nowbuyLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(24)
        }
        
        detailproductLabel.snp.makeConstraints {
            $0.top.equalTo(detailpriceLabel.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(19)
        }
        
       koreanproductLabel.snp.makeConstraints {
            $0.top.equalTo(detailproductLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(14)
        }
        
       separateview.snp.makeConstraints {
           $0.top.equalTo(koreanproductLabel.snp.bottom).offset(54)
           $0.leading.trailing.equalToSuperview()
           $0.height.equalTo(2)
        }
        
       scrapmountLabel.snp.makeConstraints {
             $0.bottom.equalToSuperview().offset(-45)
             $0.leading.equalToSuperview().offset(16)
             $0.trailing.equalToSuperview().offset(-329)
             $0.height.equalTo(14)
        }
        
       detailscrapimage.snp.makeConstraints {
            $0.bottom.equalTo(scrapmountLabel.snp.top).offset(2)
            $0.leading.equalToSuperview().offset(17)
            $0.width.equalTo(26)
            $0.height.equalTo(26)
        }
        
        buybutton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-38)
            $0.leading.equalTo(scrapmountLabel.snp.trailing).offset(19)
            $0.height.equalTo(49)
            $0.trailing.equalToSuperview().offset(-163)
        }
        
        sellbutton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-38)
            $0.leading.equalTo(buybutton.snp.trailing).offset(6)
            $0.height.equalTo(49)
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
    
}
