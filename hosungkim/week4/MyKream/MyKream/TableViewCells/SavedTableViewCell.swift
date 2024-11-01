//
//  SavedTableViewCell.swift
//  MyKream
//
//  Created by 김호성 on 2024.10.13.
//

import UIKit
import SnapKit

class SavedTableViewCell: UITableViewCell {
    
    static let identifier: String = "DiceCell"
    
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
        addComponents()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        ivProduct.image = nil
        lbTitle.text = nil
        lbDescription.text = nil
        ivSaved.image = nil
        lbPrice.text = nil
    }
    func configure(model: SavedModel) {
        ivProduct.image = model.image
        lbTitle.text = model.title
        lbDescription.text = model.description
        ivSaved.image = UIImage(named: "icon_saved_fill")
        lbPrice.text = model.price
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(ivProduct)
        self.addSubview(lbTitle)
        self.addSubview(lbDescription)
        self.addSubview(ivSaved)
        self.addSubview(lbPrice)
        
        ivProduct.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(13)
            $0.bottom.equalToSuperview().inset(14)
            $0.width.height.equalTo(72)
        }
        lbTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.leading.equalTo(ivProduct.snp.trailing).offset(13)
            $0.height.equalTo(19)
            $0.trailing.equalToSuperview().inset(142)
        }
        lbDescription.snp.makeConstraints {
            $0.top.equalTo(lbTitle.snp.bottom)
            $0.leading.equalTo(ivProduct.snp.trailing).offset(13)
            $0.trailing.equalToSuperview().inset(142)
        }
        ivSaved.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(14)
            $0.height.equalTo(18)
        }
        lbPrice.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(22)
        }
    }
    
    private lazy var ivProduct: UIImageView = {
        let imageView = UIImageView()
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var lbTitle: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var lbDescription: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 9)
        label.textColor = UIColor(red: 161/255, green: 161/255, blue: 161/255, alpha: 1)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var ivSaved: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "icon_saved_fill")
        
        return imageView
    }()
    
    private lazy var lbPrice: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        
        return label
    }()
}
