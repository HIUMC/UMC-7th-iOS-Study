//
//  BuyView.swift
//  KREAM
//
//  Created by 주민영 on 11/9/24.
//

import UIKit

class BuyView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var title = UILabel().then {
        $0.text = "구매하기"
        $0.font = .systemFont(ofSize: 15, weight: .bold)
    }
    
    private var subTitle = UILabel().then {
        $0.text = "(가격 단위: 원)"
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 10, weight: .regular)
    }
    
    let cancelButton = UIButton().then {
        $0.setImage(UIImage(named: "icon_x"), for: .normal)
    }
    
    public var image = UIImageView().then {
        $0.image = UIImage(named: "item")
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = UIColor(red: 245/250, green: 245/250, blue: 245/250, alpha: 1)
        $0.layer.cornerRadius = 8
    }
    
    private var nameEn = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 14, weight: .regular)
    }
    
    private var nameKo = UILabel().then {
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.textColor = .gray
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    let sizeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 110, height: 47)
        $0.minimumInteritemSpacing = 7
        $0.minimumLineSpacing = 8
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.isUserInteractionEnabled = true
        $0.allowsSelection = true
        $0.allowsMultipleSelection = false
        $0.register(SizeCollectionViewCell.self, forCellWithReuseIdentifier: SizeCollectionViewCell.identifier)
    }
    
    private var bottomView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.systemGray6.cgColor
        $0.layer.borderWidth = 2
    }
    
    private lazy var titleContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        container.foregroundColor = UIColor.white
        return container
    }()
    
    public lazy var fastBtn: UIButton = {
        let btn = UIButton()
        
        var config = UIButton.Configuration.filled()
        
        config.baseBackgroundColor = UIColor(red: 239/255, green: 98/255, blue: 84/255, alpha: 1)
        config.baseForegroundColor = .white
        config.cornerStyle = .medium
        
        config.attributedTitle = AttributedString("345,000", attributes: titleContainer)
        config.attributedSubtitle = AttributedString("빠른배송(1-2일 소요)", attributes: AttributeContainer([
            .font: UIFont.systemFont(ofSize: 10, weight: .regular),
            .foregroundColor: UIColor(red: 1, green: 202/255, blue: 185/255, alpha: 1),
        ]))
        config.titleAlignment = .center
        config.titlePadding = 0
        
        btn.configuration = config
        
        return btn
    }()
    
    public lazy var standardBtn: UIButton = {
        let btn = UIButton()
        
        var config = UIButton.Configuration.filled()
        
        config.baseBackgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
        config.baseForegroundColor = .white
        config.cornerStyle = .medium
        
        config.attributedTitle = AttributedString("407,000", attributes: titleContainer)
        config.attributedSubtitle = AttributedString("일반배송(5-7일 소요)", attributes: AttributeContainer([
            .font: UIFont.systemFont(ofSize: 10, weight: .regular),
            .foregroundColor: UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1),
        ]))
        config.titleAlignment = .center
        config.titlePadding = 0
        
        btn.configuration = config
        
        return btn
    }()
    
    private lazy var btnStack = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.spacing = 6
    }
    
    private func setupView() {
        [
            title,
            subTitle,
            cancelButton,
            image,
            nameEn,
            nameKo,
            sizeCollectionView,
            bottomView
        ].forEach {
            addSubview($0)
        }
        
        btnStack.addArrangedSubview(fastBtn)
        btnStack.addArrangedSubview(standardBtn)
        bottomView.addSubview(btnStack)
        
        title.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        subTitle.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
        
        image.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(91)
        }
        
        nameEn.snp.makeConstraints {
            $0.top.equalTo(image.snp.top).offset(18)
            $0.leading.equalTo(image.snp.trailing).offset(15)
        }
        
        nameKo.snp.makeConstraints {
            $0.top.equalTo(nameEn.snp.bottom).offset(4)
            $0.leading.equalTo(image.snp.trailing).offset(15)
        }
        
        sizeCollectionView.snp.makeConstraints {
            $0.top.equalTo(image.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(344)
            $0.height.equalTo(102)
        }
        
        bottomView.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-95)
        }
        
        btnStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        fastBtn.snp.makeConstraints {
            $0.height.equalTo(52)
        }
        
        standardBtn.snp.makeConstraints {
            $0.height.equalTo(52)
        }
    }

}
