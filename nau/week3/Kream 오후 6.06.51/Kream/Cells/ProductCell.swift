//
//  ProductCell.swift
//  Kream
//
//  Created by KoNangYeon on 10/14/24.
//

import UIKit
import Then
import SnapKit

class ProductCell: UITableViewCell {
    
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
        self.productName.text = nil
        self.productDetail.text = nil
        self.productPrice.text = nil
        self.productImageView.image = nil
        self.saveImage.image = nil
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //상품 이미지는 뷰컨에서..
    private lazy var productImageView = UIImageView().then() {_ in}
    
    private lazy var productName = UILabel().then() {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = UIColor.black
    }
    
    private lazy var productDetail = UILabel().then() {
        $0.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        $0.textColor = UIColor(red: 0.6314, green: 0.6314, blue: 0.6314, alpha: 1.0)
        $0.numberOfLines = 2
    }
    
    private lazy var productPrice = UILabel().then() {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = UIColor.black
    }
    
    private lazy var saveImage = UIImageView().then(){
        $0.image = UIImage(named: "찜하기 버튼")
    }
    
    private func setViews() {
        self.addSubview(productImageView)
        self.addSubview(productName)
        self.addSubview(productDetail)
        self.addSubview(productPrice)
        self.addSubview(saveImage)
    }
    
    private func setConstaints() {
        productImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(13)
            $0.left.equalToSuperview().inset(13)
            $0.bottom.equalToSuperview().inset(14)
            $0.width.height.equalTo(72)
        }
        
        saveImage.snp.makeConstraints{
            $0.top.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(17)
            $0.width.height.equalTo(18)
        }
        
        productName.snp.makeConstraints{
            $0.top.equalToSuperview().inset(13)
            $0.left.equalTo(productImageView.snp.right).offset(13)
        }
        
        productDetail.snp.makeConstraints{
            $0.top.equalTo(productName.snp.top).offset(19)
            $0.left.equalTo(productImageView.snp.right).offset(13)
        }
        
        productPrice.snp.makeConstraints{
            $0.top.equalToSuperview().inset(67)
            $0.right.equalToSuperview().inset(16)
        }
    }
    
    public func configure(model: ProductModel) {
        self.productImageView.image = UIImage(named: model.productImage!)
        self.productName.text = model.productName
        self.productPrice.text = model.productPrice
        self.productDetail.text = model.productDetail
        self.saveImage.image = UIImage(named: model.saveImage!)
    }

}
