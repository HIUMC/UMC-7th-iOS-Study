//
//  BuyView.swift
//  cloneKream
//
//  Created by 김서현 on 11/11/24.
//

import UIKit

class BuyView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpView()
        setUpBottomView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var dismissButton = UIButton().then {
        $0.setImage(.dismiss, for: .normal)
    }
    
    
    
    private lazy var titleStack = UIStackView().then {
        let title = UILabel().then { title in
            title.text = "구매하기"
            title.textColor = .black
            title.font = .systemFont(ofSize: 15, weight: .bold)
        }
        let description = UILabel().then { des in
            des.text = "(가격 단위: 원)"
            des.textColor = UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1)
            des.font = .systemFont(ofSize: 10, weight: .regular)
        }
        $0.addArrangedSubview(title)
        $0.addArrangedSubview(description)
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 3
    }
    
    private lazy var productImage = UIImageView().then {
        $0.image = .pd1
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    private lazy var engNameLabel = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .regular)
    }
    
    private lazy var korNameLabel = UILabel().then {
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    private lazy var nameStack = UIStackView().then {
        $0.addArrangedSubview(engNameLabel)
        $0.addArrangedSubview(korNameLabel)
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 5
    }
        
    public lazy var sizeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({
        $0.estimatedItemSize = .init(width: 110, height: 47)
        $0.minimumLineSpacing = 5
        $0.minimumInteritemSpacing = 7
        $0.scrollDirection = .horizontal
    })).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(ProductSizeCollectionViewCell.self, forCellWithReuseIdentifier: ProductSizeCollectionViewCell.identifier)
    }
    
    
    
    
    private lazy var bottomView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1).cgColor
        $0.layer.borderWidth = 2
    }
    
    private lazy var fastPrice = UILabel().then {
        $0.text = "345,000"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
    }
    
    //문제 생기면 보기
    private lazy var fastPriceLabel = UILabel().then {
        $0.text = "빠른배송(1-2일 소요)"
        $0.textColor = UIColor(red: 255/255, green: 202/255, blue: 185/255, alpha: 1)
        $0.font = .systemFont(ofSize: 10, weight: .regular)
    }
    
    private lazy var fastButtonStack = UIStackView(arrangedSubviews: [fastPrice, fastPriceLabel]).then {
        $0.axis = .vertical
        $0.spacing = 4
        $0.alignment = .center
    }
    
    private lazy var normalPrice = UILabel().then {
        $0.text = "407,000"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
    }
    
    //문제 생기면 보기
    private lazy var normalPriceLabel = UILabel().then {
        $0.text = "일반배송(5-7일 소요)"
        $0.textColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        $0.font = .systemFont(ofSize: 10, weight: .regular)
    }
    
    
    private lazy var normalButtonStack = UIStackView(arrangedSubviews: [normalPrice, normalPriceLabel]).then {
        $0.axis = .vertical
        $0.spacing = 4
        $0.alignment = .center
    }
    
    public lazy var fastButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 239/255, green: 98/255, blue: 84/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    private lazy var normalButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    private lazy var buttonStack = UIStackView(arrangedSubviews: [fastButton, normalButton]).then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.alignment = .center
        $0.distribution = .fillEqually
    }
    
    
    
    
    private func setUpView() {
        addSubview(titleStack)
        addSubview(dismissButton)
        addSubview(productImage)
        addSubview(nameStack)
        addSubview(sizeCollectionView)
        
        titleStack.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(20)
        }
        
        dismissButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        productImage.snp.makeConstraints {
            $0.top.equalTo(titleStack.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(91)
        }
        
        nameStack.snp.makeConstraints {
            $0.leading.equalTo(productImage.snp.trailing).offset(20)
            $0.top.equalTo(productImage.snp.top).offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        sizeCollectionView.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.bottom).offset(30)
            $0.width.equalTo(344)
            $0.height.equalTo(102)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setUpBottomView() {
        addSubview(bottomView)
        bottomView.addSubview(buttonStack)
        fastButton.addSubview(fastButtonStack)
        normalButton.addSubview(normalButtonStack)
        
        bottomView.snp.makeConstraints {
            $0.height.equalTo(101)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        buttonStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.centerX.equalToSuperview()
        }
        
        fastButton.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.width.equalTo(168)
        }
        
        normalButton.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.width.equalTo(168)
        }
        
        fastButtonStack.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        normalButtonStack.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        
    }
    
    
    
}
