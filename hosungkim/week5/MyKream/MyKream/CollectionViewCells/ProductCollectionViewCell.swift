//
//  ProductCollectionViewCell.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.03.
//

import UIKit
import SnapKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: ProductCollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var ivProduct: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    public lazy var btnBookmark: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        return button
    }()
    public lazy var lbTrading: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10)
        label.textColor = .black
        return label
    }()
    public lazy var lbTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        return label
    }()
    public lazy var lbSubtitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    public lazy var lbPrice: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.textColor = .black
        return label
    }()
    public lazy var lbSubprice: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10)
        label.textColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1)
        label.text = "즉시 구매가"
        return label
    }()
    
    private func setupView() {
        self.addSubview(ivProduct)
        self.addSubview(lbTrading)
        self.addSubview(btnBookmark)
        self.addSubview(lbTitle)
        self.addSubview(lbSubtitle)
        self.addSubview(lbPrice)
        self.addSubview(lbSubprice)
        
        ivProduct.snp.makeConstraints({
            $0.top.leading.trailing.equalToSuperview()
            $0.width.height.equalTo(142)
        })
        lbTrading.snp.makeConstraints({
            $0.top.trailing.equalToSuperview().inset(8)
        })
        btnBookmark.snp.makeConstraints({
            $0.bottom.equalTo(ivProduct.snp.bottom).offset(-10)
            $0.trailing.equalToSuperview().inset(10)
        })
        lbTitle.snp.makeConstraints({
            $0.top.equalTo(ivProduct.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(4)
        })
        lbSubtitle.snp.makeConstraints({
            $0.top.equalTo(lbTitle.snp.bottom).offset(3)
            $0.leading.trailing.equalToSuperview().inset(4)
        })
        lbPrice.snp.makeConstraints({
            $0.leading.trailing.equalToSuperview().inset(4)
        })
        lbSubprice.snp.makeConstraints({
            $0.top.equalTo(lbPrice.snp.bottom).offset(2)
            $0.leading.trailing.equalToSuperview().inset(4)
            $0.bottom.equalToSuperview()
        })
    }
}
