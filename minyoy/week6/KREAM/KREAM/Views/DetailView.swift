//
//  DetailView.swift
//  KREAM
//
//  Created by 주민영 on 11/9/24.
//

import UIKit

class DetailView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var image = UIImageView().then {
        $0.image = UIImage(named: "item")
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = UIColor(red: 245/250, green: 245/250, blue: 245/250, alpha: 1)
        $0.layer.borderColor = CGColor(red: 233/250, green: 233/250, blue: 233/250, alpha: 1)
        $0.layer.borderWidth = 1
    }
    
    public lazy var imageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 53, height: 53)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = true
        $0.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
    }
    
    private var instant = UILabel().then {
        $0.text = "즉시 구매가"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 12, weight: .light)
    }
    
    public lazy var price = UILabel().then {
        $0.text = "228,000" + "원"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    public lazy var nameEn = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    private lazy var nameKo = UILabel().then {
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.textColor = .gray
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    private var bottomView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.systemGray6.cgColor
        $0.layer.borderWidth = 2
    }
    
    private var savedIcon = UIButton().then {
        $0.setImage(UIImage(named: "icon_saved"), for: .normal)
        $0.addTarget(self, action: #selector(savedBtnTap), for: .touchUpInside)
    }

    @objc private func savedBtnTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if sender.isSelected {
            sender.setImage(.iconSavedFill, for: .normal)
            savedNum.text = "2,123"
        } else {
            sender.setImage(.iconSaved, for: .normal)
            savedNum.text = "2,122"
        }
    }
    
    private var savedNum = UILabel().then {
        $0.text = "2,122"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    private lazy var titleContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        container.foregroundColor = UIColor.white
        return container
    }()
    
    let buyBtn = TradeButton(backGroundColor: UIColor(red: 239/255, green: 98/255, blue: 84/255, alpha: 1), title: "구매", price: "345,000", sub: "즉시 구매가", subTitleColor: UIColor(red: 163/255, green: 55/255, blue: 35/255, alpha: 1))
    
    let sellBtn = TradeButton(backGroundColor: UIColor(red: 65/255, green: 185/255, blue: 122/255, alpha: 1), title: "판매", price: "396,000", sub: "즉시 판매가", subTitleColor: UIColor(red: 31/255, green: 119/255, blue: 69/255, alpha: 1))
    
    private lazy var btnStack = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.spacing = 6
    }
    
    private func setupView() {
        [
            image,
            imageCollectionView,
            instant,
            price,
            nameEn,
            nameKo,
            bottomView
        ].forEach {
            addSubview($0)
        }
        
        btnStack.addArrangedSubview(buyBtn)
        btnStack.addArrangedSubview(sellBtn)
        bottomView.addSubview(savedIcon)
        bottomView.addSubview(savedNum)
        bottomView.addSubview(btnStack)
        
        image.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(374)
            $0.height.equalTo(373)
        }
        
        imageCollectionView.snp.makeConstraints {
            $0.top.equalTo(image.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(53)
        }
        
        instant.snp.makeConstraints {
            $0.top.equalTo(imageCollectionView.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(16)
        }
        
        price.snp.makeConstraints {
            $0.top.equalTo(instant.snp.bottom).offset(4)
            $0.leading.equalTo(instant.snp.leading)
        }
        
        nameEn.snp.makeConstraints {
            $0.top.equalTo(price.snp.bottom).offset(18)
            $0.leading.equalTo(instant.snp.leading)
        }
        
        nameKo.snp.makeConstraints {
            $0.top.equalTo(nameEn.snp.bottom).offset(6)
            $0.leading.equalTo(instant.snp.leading)
        }
        
        bottomView.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-95)
        }
        
        savedIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(25)
        }
        
        savedNum.snp.makeConstraints {
            $0.top.equalTo(savedIcon.snp.bottom)
            $0.centerX.equalTo(savedIcon.snp.centerX)
        }
        
        btnStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalTo(savedIcon.snp.trailing).offset(19)
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
}
