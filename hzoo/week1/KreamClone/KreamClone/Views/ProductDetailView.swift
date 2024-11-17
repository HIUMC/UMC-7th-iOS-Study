//
//  ProductDetailView.swift
//  KreamClone
//
//  Created by 이현주 on 11/7/24.
//

import UIKit

class ProductDetailView: UIView {
    
    public lazy var nowImage: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "black")
        i.contentMode = .scaleAspectFill
        return i
    }()
    
    public let productCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 53, height: 53)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
    }
    
    public lazy var rightNow: UILabel = {
        let l = UILabel()
        l.text = "즉시 구매가"
        l.font = .systemFont(ofSize: 12, weight: .light)
        l.textColor = .black
        return l
    }()
    
    public lazy var price: UILabel = {
        let l = UILabel()
        l.text = "228,000원"
        l.font = .systemFont(ofSize: 20, weight: .semibold)
        l.textColor = .black
        return l
    }()
    
    public lazy var engName: UILabel = {
        let l = UILabel()
        l.text = "Matin Kim Logo Coating Jumper"
        l.font = .systemFont(ofSize: 16, weight: .regular)
        l.textColor = .black
        return l
    }()
    
    public lazy var korName: UILabel = {
        let l = UILabel()
        l.text = "마뗑킴 로고 코팅 점퍼 블랙"
        l.font = .systemFont(ofSize: 12, weight: .regular)
        l.textColor = UIColor(hex: "#9C9C9C")
        return l
    }()
    
    public lazy var bar: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hex: "#F3F3F3")
        return v
    }()
    
    public lazy var savedBtn: UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        b.setImage(UIImage(named: "nSavedIcon"), for: .normal)
        return b
    }()
    
    public lazy var savedCount: UILabel = {
        let l = UILabel()
        l.text = "2,122"
        l.textColor = .black
        l.font = .systemFont(ofSize: 12, weight: .regular)
        return l
    }()
    
    public lazy var savedStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [savedBtn, savedCount])
        stackView.axis = .vertical // 수직으로 배치
        stackView.spacing = 0
        stackView.alignment = .center
        //stackView.distribution = .fill
        return stackView
    }()

    
    public lazy var buyBtn: UIButton = {
        let b = UIButton()
        var configuration = UIButton.Configuration.plain()
        b.backgroundColor = UIColor(hex: "#EF6254")
        b.layer.cornerRadius = 10
        return b
    }()
    
    public lazy var buyLabel1: UILabel = {
        let l = UILabel()
        l.text = "구매"
        l.textColor = .white
        l.font = .systemFont(ofSize: 16, weight: .semibold)
        return l
    }()
    
    public lazy var buyLabel2: UILabel = {
        let l = UILabel()
        l.text = "345,000"
        l.textColor = .white
        l.font = .systemFont(ofSize: 13, weight: .semibold)
        return l
    }()
    
    public lazy var buyLabel3: UILabel = {
        let l = UILabel()
        l.text = "즉시 구매가"
        l.textColor = UIColor(hex: "#A33723")
        l.font = .systemFont(ofSize: 10, weight: .regular)
        return l
    }()
    
    public lazy var sellBtn: UIButton = {
        let b = UIButton()
        b.backgroundColor = UIColor(hex: "#41B97A")
        b.layer.cornerRadius = 10
        return b
    }()
    
    public lazy var sellLabel1: UILabel = {
        let l = UILabel()
        l.text = "판매"
        l.textColor = .white
        l.font = .systemFont(ofSize: 16, weight: .semibold)
        return l
    }()
    
    public lazy var sellLabel2: UILabel = {
        let l = UILabel()
        l.text = "396,000"
        l.textColor = .white
        l.font = .systemFont(ofSize: 13, weight: .semibold)
        return l
    }()
    
    public lazy var sellLabel3: UILabel = {
        let l = UILabel()
        l.text = "즉시 판매가"
        l.textColor = UIColor(hex: "#1F7745")
        l.font = .systemFont(ofSize: 10, weight: .regular)
        return l
    }()
    
    public lazy var btnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [buyBtn, sellBtn])
        stackView.axis = .horizontal // 수직으로 배치
        stackView.spacing = 6
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponenets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponenets() {
        addSubview(nowImage)
        addSubview(productCollectionView)
        addSubview(rightNow)
        addSubview(price)
        addSubview(engName)
        addSubview(korName)
        addSubview(bar)
        addSubview(savedStackView)
        addSubview(btnStackView)
        buyBtn.addSubview(buyLabel1)
        buyBtn.addSubview(buyLabel2)
        buyBtn.addSubview(buyLabel3)
        sellBtn.addSubview(sellLabel1)
        sellBtn.addSubview(sellLabel2)
        sellBtn.addSubview(sellLabel3)
        
        nowImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.height.width.equalTo(373)
        }
        
        productCollectionView.snp.makeConstraints { make in
            make.top.equalTo(nowImage.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(53)
        }
        
        rightNow.snp.makeConstraints { make in
            make.top.equalTo(productCollectionView.snp.bottom).offset(23)
            make.leading.equalTo(safeAreaLayoutGuide).offset(16)
        }
        
        price.snp.makeConstraints { make in
            make.top.equalTo(rightNow.snp.bottom).offset(4)
            make.leading.equalTo(rightNow.snp.leading)
        }
        
        engName.snp.makeConstraints { make in
            make.top.equalTo(price.snp.bottom).offset(18)
            make.leading.equalTo(price.snp.leading)
        }
        
        korName.snp.makeConstraints { make in
            make.top.equalTo(engName.snp.bottom).offset(6)
            make.leading.equalTo(engName.snp.leading)
        }
        
        bar.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-95)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(2)
        }
        
        savedStackView.snp.makeConstraints { make in
            make.top.equalTo(bar.snp.bottom).offset(12)
            make.leading.equalTo(safeAreaLayoutGuide).offset(15)
            make.width.equalTo(35)
        }
        
        savedBtn.snp.makeConstraints { make in
            make.width.equalTo(26)
            make.height.equalTo(26)
        }
                
        btnStackView.snp.makeConstraints { make in
            make.centerY.equalTo(savedStackView)
            make.leading.equalTo(savedStackView.snp.trailing).offset(15)
            make.height.equalTo(49)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-15)
        }
        
        buyLabel1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        buyLabel2.snp.makeConstraints { make in
            make.leading.equalTo(buyLabel1.snp.trailing).offset(21)
            make.top.equalToSuperview().offset(8)
        }
        
        buyLabel3.snp.makeConstraints { make in
            make.leading.equalTo(buyLabel2.snp.leading)
            make.top.equalTo(buyLabel2.snp.bottom).offset(2)
        }
        
        sellLabel1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        sellLabel2.snp.makeConstraints { make in
            make.leading.equalTo(sellLabel1.snp.trailing).offset(21)
            make.top.equalToSuperview().offset(8)
        }
        
        sellLabel3.snp.makeConstraints { make in
            make.leading.equalTo(sellLabel2.snp.leading)
            make.top.equalTo(sellLabel2.snp.bottom).offset(2)
        }
    }
}
