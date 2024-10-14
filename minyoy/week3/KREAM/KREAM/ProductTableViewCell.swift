//
//  ProductTableViewCell.swift
//  KREAM
//
//  Created by 주민영 on 10/13/24.
//

import UIKit
import SnapKit

class ProductTableViewCell: UITableViewCell {
    
    static let identifier = "ProductCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstaints()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImageView.image = nil
        self.productTitle.text = nil
        self.productSubTitle.text = nil
        self.productPrice.text = nil
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var productTitle: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        name.textColor = UIColor.black
        return name
    }()
    
    private lazy var productSubTitle: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 9)
        name.textColor = UIColor.gray
        name.numberOfLines = 2
        return name
    }()
    
    private lazy var productPrice: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        name.textColor = UIColor.black
        return name
    }()
    
    private lazy var productSavedButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "icon_saved_fill.png"), for: .normal)
        return btn
    }()
    
    private func setViews() {
        self.addSubview(productImageView)
        self.addSubview(productTitle)
        self.addSubview(productSubTitle)
        self.addSubview(productPrice)
        self.addSubview(productSavedButton)
    }
    
    private func setConstaints() {
        productImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.left.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().offset(-14)
            $0.width.height.equalTo(72)
        }
        
        productTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.left.equalTo(productImageView.snp.right).offset(13)
        }
        
        productSubTitle.snp.makeConstraints {
            $0.top.equalTo(productTitle.snp.bottom)
            $0.left.equalTo(productTitle.snp.left)
            $0.bottom.equalToSuperview().offset(-34)
            $0.width.equalTo(160)
        }
        
        productPrice.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        productSavedButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.right.equalToSuperview().offset(-17)
        }
    }
    
    public func configure(model: ProductModel) {
        self.productImageView.image = UIImage(named: model.productImage)
        self.productTitle.text = model.productTitle
        self.productSubTitle.text = model.productSubTitle
        self.productPrice.text = model.productPrice
    }

}
