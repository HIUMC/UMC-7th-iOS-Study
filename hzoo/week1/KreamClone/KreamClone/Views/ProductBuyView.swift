//
//  ProductBuyView.swift
//  KreamClone
//
//  Created by 이현주 on 11/10/24.
//

import UIKit

class ProductBuyView: UIView {
    
    public lazy var buy: UILabel = {
        let l = UILabel()
        l.text = "구매하기"
        l.textColor = .black
        l.font = .systemFont(ofSize: 15, weight: .bold)
        return l
    }()
    
    public lazy var won: UILabel = {
        let l = UILabel()
        l.text = "(가격 단위: 원)"
        l.textColor = UIColor(hex: "#929292")
        l.font = .systemFont(ofSize: 10, weight: .regular)
        return l
    }()
    
    public lazy var cancelBtn: UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        b.setImage(UIImage(systemName: "xmark"), for: .normal)
        b.tintColor = .black
        return b
    }()
    
    public lazy var productImg: UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFill
        i.layer.cornerRadius = 8
        i.layer.masksToBounds = true
        return i
    }()
    
    public lazy var engName: UILabel = {
        let l = UILabel()
        l.text = "Matin Kim Logo Coating Jumper"
        l.textColor = UIColor(hex: "#0A0A0A")
        l.font = .systemFont(ofSize: 14, weight: .regular)
        return l
    }()
    
    public lazy var korName: UILabel = {
        let l = UILabel()
        l.text = "마뗑킴 로고 코팅 점퍼 블랙"
        l.textColor = UIColor(hex: "#9C9C9C")
        l.font = .systemFont(ofSize: 12, weight: .regular)
        return l
    }()
    
    public let sizeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 110, height: 47)
        $0.minimumInteritemSpacing = 7
    }).then {
        $0.register(SizeCollectionViewCell.self, forCellWithReuseIdentifier: SizeCollectionViewCell.identifier)
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
    }
    
    public lazy var bar: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hex: "#F3F3F3")
        return v
    }()
    
    public lazy var fastBtn: UIButton = {
        let b = UIButton()
        var configuration = UIButton.Configuration.plain()
        b.backgroundColor = UIColor(hex: "#EF6254")
        b.layer.cornerRadius = 10
        return b
    }()
    
    public lazy var fastLabel1: UILabel = {
        let l = UILabel()
        l.text = "345,000"
        l.textColor = .white
        l.font = .systemFont(ofSize: 14, weight: .semibold)
        return l
    }()
    
    public lazy var fastLabel2: UILabel = {
        let l = UILabel()
        l.text = "빠른배송(1-2일 소요)"
        l.textColor = UIColor(hex: "#FFCAB9")
        l.font = .systemFont(ofSize: 10, weight: .regular)
        return l
    }()
    
    public lazy var normalBtn: UIButton = {
        let b = UIButton()
        b.backgroundColor = UIColor(hex: "#222222")
        b.layer.cornerRadius = 10
        return b
    }()
    
    public lazy var normalLabel1: UILabel = {
        let l = UILabel()
        l.text = "407,000"
        l.textColor = .white
        l.font = .systemFont(ofSize: 14, weight: .semibold)
        return l
    }()
    
    public lazy var normalLabel2: UILabel = {
        let l = UILabel()
        l.text = "일반배송(5-7일 소요)"
        l.textColor = UIColor(hex: "#E2E2E2")
        l.font = .systemFont(ofSize: 10, weight: .regular)
        return l
    }()
    
    public lazy var btnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fastBtn, normalBtn])
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
        addSubview(buy)
        addSubview(won)
        addSubview(cancelBtn)
        addSubview(productImg)
        addSubview(engName)
        addSubview(korName)
        addSubview(sizeCollectionView)
        addSubview(bar)
        addSubview(btnStackView)
        fastBtn.addSubview(fastLabel1)
        fastBtn.addSubview(fastLabel2)
        normalBtn.addSubview(normalLabel1)
        normalBtn.addSubview(normalLabel2)
        
        buy.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        won.snp.makeConstraints { make in
            make.top.equalTo(buy.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        cancelBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-16)
            make.width.height.equalTo(20)
        }
        
        productImg.snp.makeConstraints { make in
            make.top.equalTo(won.snp.bottom).offset(11)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(91)
        }
        
        engName.snp.makeConstraints { make in
            make.top.equalTo(won.snp.bottom).offset(29)
            make.leading.equalTo(productImg.snp.trailing).offset(15)
        }
        
        korName.snp.makeConstraints { make in
            make.top.equalTo(engName.snp.bottom).offset(4)
            make.leading.equalTo(engName.snp.leading)
        }
        
        sizeCollectionView.snp.makeConstraints { make in
            make.top.equalTo(productImg.snp.bottom).offset(35)
            make.horizontalEdges.equalToSuperview().inset(15)
            make.height.equalTo(105)
        }
        
        bar.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-95)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(2)
        }
        
        btnStackView.snp.makeConstraints { make in
            make.top.equalTo(bar.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(18)
            make.height.equalTo(52)
        }
        
        fastLabel1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(11)
        }
        
        fastLabel2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-11)
        }
        
        normalLabel1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(11)
        }
        
        normalLabel2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-11)
        }
    }
}
