//
//  BuyView.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.10.
//

import UIKit
import SnapKit

class BuyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(btnClose)
        self.addSubview(lbTitle)
        self.addSubview(lbSubTitle)
        self.addSubview(ivProduct)
        self.addSubview(lbProductTitle)
        self.addSubview(lbProductSubTitle)
        self.addSubview(cvSize)
        self.addSubview(separatorView)
        self.addSubview(btnFastBuy)
        self.addSubview(btnBuy)
        btnFastBuy.addSubview(lbSubFastBuy1)
        btnFastBuy.addSubview(lbSubFastBuy2)
        btnBuy.addSubview(lbSubBuy1)
        btnBuy.addSubview(lbSubBuy2)
        
        btnClose.snp.makeConstraints({
            $0.top.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(20)
        })
        lbTitle.snp.makeConstraints({
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        })
        lbSubTitle.snp.makeConstraints({
            $0.top.equalTo(lbTitle.snp.bottom)
            $0.centerX.equalToSuperview()
        })
        ivProduct.snp.makeConstraints({
            $0.top.equalTo(lbSubTitle.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(91)
        })
        lbProductTitle.snp.makeConstraints({
            $0.top.equalTo(ivProduct.snp.top).offset(18)
            $0.leading.equalTo(ivProduct.snp.trailing).offset(15)
        })
        lbProductSubTitle.snp.makeConstraints({
            $0.top.equalTo(lbProductTitle.snp.bottom).offset(4)
            $0.leading.equalTo(ivProduct.snp.trailing).offset(15)
        })
        cvSize.snp.makeConstraints({
            $0.top.equalTo(ivProduct.snp.bottom).offset(35)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(120)
        })
        separatorView.snp.makeConstraints({
            $0.bottom.equalToSuperview().inset(101)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        })
        btnFastBuy.snp.makeConstraints({
            $0.top.equalTo(separatorView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(39)
        })
        btnBuy.snp.makeConstraints({
            $0.top.equalTo(separatorView.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(39)
            $0.leading.equalTo(btnFastBuy.snp.trailing).offset(6)
            $0.width.equalTo(btnFastBuy.snp.width)
        })
        lbSubFastBuy1.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(11)
        })
        lbSubFastBuy2.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.top.equalTo(lbSubFastBuy1.snp.bottom)
        })
        lbSubBuy1.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(11)
        })
        lbSubBuy2.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.top.equalTo(lbSubBuy1.snp.bottom)
        })
    }
    public lazy var btnClose: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(resource: .xmark), for: .normal)
        return button
    }()
    private lazy var lbTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.text = "구매하기"
        return label
    }()
    private lazy var lbSubTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1)
        label.text = "(가격 단위: 원)"
        return label
    }()
    private lazy var ivProduct: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var lbProductTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    private lazy var lbProductSubTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
        return label
    }()
    public lazy var cvSize: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .init(width: 110, height: 49)
        layout.minimumInteritemSpacing = 7
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .clear
        collectionView.register(SizeCollectionViewCell.self, forCellWithReuseIdentifier: SizeCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        return view
    }()
    public lazy var btnFastBuy: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 239/255, green: 98/255, blue: 84/255, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }()
    private lazy var lbSubFastBuy1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.text = "345,000"
        return label
    }()
    private lazy var lbSubFastBuy2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor(red: 255/255, green: 202/255, blue: 185/255, alpha: 1)
        label.text = "빠른배송(1~2일 소요)"
        return label
    }()
    private lazy var btnBuy: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        return button
    }()
    private lazy var lbSubBuy1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.text = "407,000"
        return label
    }()
    private lazy var lbSubBuy2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        label.text = "일반배송(5~7일 소요)"
        return label
    }()
    
    func applyProductModel(productModel: ProductModel?) {
        ivProduct.kf.setImage(with: productModel?.image)
        lbProductTitle.text = productModel?.title
        lbProductSubTitle.text = productModel?.subtitle
    }
    
}
