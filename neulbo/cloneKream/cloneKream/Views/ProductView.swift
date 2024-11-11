//
//  ProductView.swift
//  cloneKream
//
//  Created by 김서현 on 11/10/24.
//

import UIKit

class ProductView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setView()
        setBottomView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var productImage = UIImageView().then {
        $0.image = .pd1
    }
    
    public lazy var otherColorCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({
        $0.estimatedItemSize = .init(width: 53, height: 53)
        $0.minimumLineSpacing = 8
        $0.scrollDirection = .horizontal
    })).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(OtherColorCollectionViewCell.self, forCellWithReuseIdentifier: OtherColorCollectionViewCell.identifier)
        $0.showsHorizontalScrollIndicator = false
    }
    
    private lazy var descripLabel = UILabel().then {
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
    }
    
    private lazy var priceLabel = UILabel().then {
        $0.text = "228,000원"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textColor = .black
    }
    
    private lazy var engNameLabel = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
    }
    
    private lazy var korNameLabel = UILabel().then {
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
    }
    
    private lazy var priceStack = UIStackView(arrangedSubviews: [descripLabel, priceLabel]).then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 8
    }
    
    private lazy var nameStack = UIStackView(arrangedSubviews: [engNameLabel, korNameLabel]).then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 8
    }
    
    private lazy var bottomView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1).cgColor
        $0.layer.borderWidth = 2
    }
    
    private lazy var buyingPrice = UILabel().then {
        $0.text = "345,000"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
    }
    
    //문제 생기면 보기
    private let buyingPriceLabel = UILabel().then {
        $0.text = "즉시 구매가"
        $0.textColor = UIColor(red: 163/255, green: 55/255, blue: 35/255, alpha: 1)
        $0.font = .systemFont(ofSize: 10, weight: .regular)
    }
    
    private let buyLabel = UILabel().then { label in
        label.text = "구매"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    private lazy var buyButtonStack = UIStackView(arrangedSubviews: [buyingPrice, buyingPriceLabel]).then {
        $0.axis = .vertical
        $0.spacing = 4
        $0.alignment = .leading
    }
    
    private lazy var sellingPrice = UILabel().then {
        $0.text = "396,000"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
    }
    
    //문제 생기면 보기
    private let sellingPriceLabel = UILabel().then {
        $0.text = "즉시 판매가"
        $0.textColor = UIColor(red: 31/255, green: 119/255, blue: 69/255, alpha: 1)
        $0.font = .systemFont(ofSize: 10, weight: .regular)
    }
    
    private let sellLabel = UILabel().then { label in
        label.text = "판매"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    private lazy var sellButtonStack = UIStackView(arrangedSubviews: [sellingPrice, sellingPriceLabel]).then {
        $0.axis = .vertical
        $0.spacing = 4
        $0.alignment = .leading
    }
    
    public lazy var buyButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 239/255, green: 98/255, blue: 84/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    private lazy var sellButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 65/255, green: 185/255, blue: 122/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    private lazy var buttonStack = UIStackView(arrangedSubviews: [buyButton, sellButton]).then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.alignment = .center
        $0.distribution = .fillEqually
    }
    
    private lazy var bookmarkButton = UIButton().then {
        $0.setImage(.bookmark, for: .normal)
    }
    
    private lazy var bookmarkLabel = UILabel().then {
        $0.text = "2,172"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    private lazy var bookmarkStack = UIStackView(arrangedSubviews: [bookmarkButton, bookmarkLabel]).then {
        $0.axis = .vertical
        $0.spacing = 2
        $0.alignment = .center
    }
    
    private func setView() {
        addSubview(productImage)
        addSubview(otherColorCollectionView)
        addSubview(priceStack)
        addSubview(nameStack)
        addSubview(bottomView)
        
        productImage.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(373)
        }
        
        otherColorCollectionView.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(53)
        }
        
        priceStack.snp.makeConstraints {
            $0.top.equalTo(otherColorCollectionView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        nameStack.snp.makeConstraints {
            $0.top.equalTo(priceStack.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            
        }
    }
    
    private func setBottomView() {
        bottomView.addSubview(bookmarkStack)
        bottomView.addSubview(buttonStack)
        
        buyButton.addSubview(buyLabel)
        buyButton.addSubview(buyButtonStack)
        
        sellButton.addSubview(sellLabel)
        sellButton.addSubview(sellButtonStack)
        
        bottomView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(95)
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.width.height.equalTo(26)
        }
        
        bookmarkStack.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(15)
        }
        
        buyButton.snp.makeConstraints {
            $0.height.equalTo(49)
            $0.width.equalTo(149)
        }
        
        buyLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        
        buyButtonStack.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(buyLabel.snp.trailing).offset(20)
        }
        
        sellButton.snp.makeConstraints {
            $0.height.equalTo(49)
            $0.width.equalTo(149)
        }
        
        sellLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        
        sellButtonStack.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(sellLabel.snp.trailing).offset(20)
        }
        
        buttonStack.snp.makeConstraints {
            $0.leading.equalTo(bookmarkStack.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(10)
        }
        
    }


}
