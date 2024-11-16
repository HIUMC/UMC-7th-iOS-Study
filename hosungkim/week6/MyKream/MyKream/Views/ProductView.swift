//
//  ProductView.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.08.
//

import UIKit
import SnapKit

class ProductView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(btnBack)
        self.addSubview(ivMainProduct)
        self.addSubview(cvImage)
        self.addSubview(lbSubprice)
        self.addSubview(lbPrice)
        self.addSubview(lbTitle)
        self.addSubview(lbSubTitle)
        self.addSubview(separatorView)
        self.addSubview(btnBookmark)
        self.addSubview(btnBuy)
        self.addSubview(btnSell)
        btnBuy.addSubview(lbSubBuy1)
        btnBuy.addSubview(lbSubBuy2)
        btnBuy.addSubview(lbSubBuy3)
        btnSell.addSubview(lbSubSell1)
        btnSell.addSubview(lbSubSell2)
        btnSell.addSubview(lbSubSell3)
        
        btnBack.snp.makeConstraints({
            $0.top.equalTo(safeAreaLayoutGuide).offset(14)
            $0.leading.equalToSuperview().inset(15)
            $0.width.height.equalTo(24)
        })
        ivMainProduct.snp.makeConstraints({
            $0.top.equalTo(btnBack.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(373)
        })
        cvImage.snp.makeConstraints({
            $0.top.equalTo(ivMainProduct.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(53)
        })
        lbSubprice.snp.makeConstraints({
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(cvImage.snp.bottom).offset(23)
        })
        lbPrice.snp.makeConstraints({
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(lbSubprice.snp.bottom).offset(4)
        })
        lbTitle.snp.makeConstraints({
            $0.leading.equalToSuperview().inset(18)
            $0.top.equalTo(lbPrice.snp.bottom).offset(4)
        })
        lbSubTitle.snp.makeConstraints({
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(lbTitle.snp.bottom).offset(6)
        })
        separatorView.snp.makeConstraints({
            $0.bottom.equalToSuperview().inset(95)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        })
        btnBookmark.snp.makeConstraints({
            $0.width.equalTo(32)
            $0.height.equalTo(38)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(45)
        })
        btnBuy.snp.makeConstraints({
            $0.top.equalTo(separatorView.snp.bottom).offset(8)
            $0.leading.equalTo(btnBookmark.snp.trailing).offset(19)
            $0.bottom.equalToSuperview().inset(38)
        })
        btnSell.snp.makeConstraints({
            $0.top.equalTo(separatorView.snp.bottom).offset(8)
            $0.leading.equalTo(btnBuy.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(btnBuy.snp.width)
            $0.bottom.equalToSuperview().inset(38)
        })
        lbSubBuy1.snp.makeConstraints({
            $0.leading.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        })
        lbSubBuy2.snp.makeConstraints({
            $0.leading.equalTo(lbSubBuy1.snp.trailing).offset(21)
            $0.top.equalToSuperview().inset(8)
        })
        lbSubBuy3.snp.makeConstraints({
            $0.top.equalTo(lbSubBuy2.snp.bottom).offset(2)
            $0.leading.equalTo(lbSubBuy1.snp.trailing).offset(21)
        })
        lbSubSell1.snp.makeConstraints({
            $0.leading.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        })
        lbSubSell2.snp.makeConstraints({
            $0.leading.equalTo(lbSubSell1.snp.trailing).offset(21)
            $0.top.equalToSuperview().inset(8)
        })
        lbSubSell3.snp.makeConstraints({
            $0.top.equalTo(lbSubSell2.snp.bottom).offset(2)
            $0.leading.equalTo(lbSubSell1.snp.trailing).offset(21)
        })
    }
    
    public lazy var btnBack: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)
        button.setImage(UIImage(resource: .iconArrowBack), for: .normal)
        return button
    }()
    private lazy var ivMainProduct: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    public lazy var cvImage: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .init(width: 53, height: 53)
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    private lazy var lbSubprice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.text = "즉시 구매가"
        return label
    }()
    private lazy var lbPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    private lazy var lbTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    private lazy var lbSubTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
        return label
    }()
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        return view
    }()
    public lazy var btnBookmark: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        
        configuration.image = UIImage(resource: .iconSaved).withTintColor(.black)
        configuration.imagePlacement = .top
        configuration.attributedTitle = AttributedString(NSAttributedString(string: "2,122", attributes: [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 12)]))
        configuration.titleAlignment = .center
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        button.configuration = configuration
        button.tintColor = .clear
        return button
    }()
    public lazy var btnBuy: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 239/255, green: 98/255, blue: 84/255, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }()
    private lazy var lbSubBuy1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.text = "구매"
        return label
    }()
    private lazy var lbSubBuy2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .white
        label.text = "345,000"
        return label
    }()
    private lazy var lbSubBuy3: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor(red: 163/255, green: 55/255, blue: 35/255, alpha: 1)
        label.text = "즉시 구매가"
        return label
    }()
    private lazy var btnSell: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 65/255, green: 185/255, blue: 122/255, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }()
    private lazy var lbSubSell1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.text = "판매"
        return label
    }()
    private lazy var lbSubSell2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .white
        label.text = "396,000"
        return label
    }()
    private lazy var lbSubSell3: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor(red: 31/255, green: 119/255, blue: 69/255, alpha: 1)
        label.text = "즉시 판매가"
        return label
    }()
    
    func applyProductModel(productModel: ProductModel?) {
        ivMainProduct.image = productModel?.image
        lbPrice.text = productModel?.price
        lbTitle.text = productModel?.title
        lbSubTitle.text = productModel?.subtitle
    }
}
