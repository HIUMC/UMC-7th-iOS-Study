//
//  SizeCollectionViewCell.swift
//  KreamClone
//
//  Created by 이현주 on 11/10/24.
//

import UIKit

class SizeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SizeCollectionViewCell"
    
    public lazy var size: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = .systemFont(ofSize: 14, weight: .regular)
        return l
    }()
    
    public lazy var price: UILabel = {
        let l = UILabel()
        l.textColor = UIColor(hex: "#D95A5D")
        l.font = .systemFont(ofSize: 12, weight: .regular)
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor(hex: "#F2F2F2")?.cgColor
        
        contentView.addSubview(size)
        contentView.addSubview(price)
        
        size.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
        }
        
        price.snp.makeConstraints { make in
            make.top.equalTo(size.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
    }
    
    public func configure(size: String, price: String) {
        self.size.text = size
        self.price.text = price
    }
}
