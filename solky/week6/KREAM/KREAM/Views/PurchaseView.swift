//
//  PurchaseView.swift
//  KREAM
//
//  Created by 이태림 on 11/11/24.
//

import UIKit
import SnapKit
import Then
class PurchaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var closebutton = UIButton().then {
       
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = .black
        $0.backgroundColor = .clear
    }
    
    public lazy var purchaseLabel = UILabel().then {
        $0.text = "구매하기"
        $0.font = .systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .black
    }
    
    public lazy var priceunitLabel = UILabel().then {
        $0.text = "(가격 단위: 원)"
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = UIColor(red: 0.57, green: 0.57, blue: 0.57, alpha: 1.00)
    }
    
    public lazy var separateview = UIView().then {
        $0.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
    }
    
    public lazy var sizeimage : UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    public lazy var sizeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.textColor = .black
    }
    
    public lazy var koreansizeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.textColor = UIColor(red: 0.61, green: 0.61, blue: 0.61, alpha: 1.00)
    }
    
    public lazy var quickdeliverybutton = UIButton().then {
        $0.backgroundColor = UIColor(red: 0.94, green: 0.38, blue: 0.33, alpha: 1.00)
        $0.layer.cornerRadius = 10
        
        let priceLabel = UILabel().then {
            $0.text = "345,000"
            $0.font = .systemFont(ofSize: 14, weight: .semibold)
            $0.textColor = .white
        }
        
        let deliveryLabel = UILabel().then {
            $0.text = "빠른배송(1-2일 소요)"
            $0.font = .systemFont(ofSize: 10, weight: .regular)
            $0.textColor = UIColor(red: 1.00, green: 0.79, blue: 0.73, alpha: 1.00)
        }
        
        $0.addSubview(priceLabel)
        $0.addSubview(deliveryLabel)
        
        priceLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(11)
            $0.height.equalTo(17)
        }
        
        deliveryLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-12)
            $0.top.equalTo(priceLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
    }
    
    public lazy var normaldeliverybutton = UIButton().then {
        $0.backgroundColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.00)
        $0.layer.cornerRadius = 10
        
        let normalpriceLabel = UILabel().then {
            $0.text = "407,000"
            $0.font = .systemFont(ofSize: 14, weight: .semibold)
            $0.textColor = .white
        }
        
        let normaldeliveryLabel = UILabel().then {
            $0.text = "일반배송(5-7일 소요)"
            $0.font = .systemFont(ofSize: 10, weight: .regular)
            $0.textColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1.00)
        }
        
        $0.addSubview(normalpriceLabel)
        $0.addSubview(normaldeliveryLabel)
        
        normalpriceLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(11)
            $0.height.equalTo(17)
        }
        
        normaldeliveryLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-12)
            $0.top.equalTo(normalpriceLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
    }
    
    
    public let SizeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 110, height: 47)
        $0.minimumInteritemSpacing = 7
        $0.minimumLineSpacing = 8
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(SizeCollectionViewCell.self, forCellWithReuseIdentifier: SizeCollectionViewCell.identifier)
    }
    
    private func setViews() {
        addSubview(closebutton)
        addSubview(purchaseLabel)
        addSubview(priceunitLabel)
        addSubview(sizeimage)
        addSubview(sizeLabel)
        addSubview(koreansizeLabel)
        addSubview(SizeCollectionView)
        addSubview(separateview)
        addSubview(quickdeliverybutton)
        addSubview(normaldeliverybutton)
    }
    
    private func setConstraints() {
        
        closebutton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
        
        purchaseLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(20)
            $0.width.equalTo(52)
            $0.height.equalTo(18)
        }
        
        priceunitLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(purchaseLabel.snp.bottom)
            $0.height.equalTo(12)
        }
        
        sizeimage.snp.makeConstraints {
            $0.top.equalTo(priceunitLabel.snp.bottom).offset(11)
            $0.leading.equalTo(16)
            $0.width.equalTo(91)
            $0.height.equalTo(91)
        }
        
        sizeLabel.snp.makeConstraints {
            $0.top.equalTo(priceunitLabel).offset(29)
            $0.leading.equalTo(sizeimage.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().offset(-51)
            $0.height.equalTo(17)
        }
        
        koreansizeLabel.snp.makeConstraints {
            $0.top.equalTo(sizeLabel.snp.bottom).offset(4)
            $0.leading.equalTo(sizeimage.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().offset(-125)
            $0.height.equalTo(14)
        }
        
        quickdeliverybutton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-39)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(168)
            $0.height.equalTo(52)
        }
        
        normaldeliverybutton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-39)
            $0.leading.equalTo(quickdeliverybutton.snp.trailing).offset(6)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(52)
        }
        
        SizeCollectionView.snp.makeConstraints {
            $0.top.equalTo(sizeimage.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(344)
            $0.height.equalTo(102)
        }
        
        separateview.snp.makeConstraints {
            $0.bottom.equalTo(normaldeliverybutton.snp.top).offset(-10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
         }
    }
    
}


