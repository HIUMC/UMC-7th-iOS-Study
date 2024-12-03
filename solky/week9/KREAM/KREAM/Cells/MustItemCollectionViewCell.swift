//
//  MustItemCollectionViewCell.swift
//  KREAM
//
//  Created by 이태림 on 11/4/24.
//

import UIKit
import SnapKit
import Then
import Kingfisher

class MustItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "MustItemCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var beautifulview = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .white
        $0.text = "@katarinanbluu"
        $0.numberOfLines = 0
    }
    
    private func setViews() {
        addSubview(beautifulview)
        addSubview(nameLabel)
    }
    
    public func loadImage(from url: String) {
        if let imageURL = URL(string: url) {
            beautifulview.kf.setImage(with: imageURL)
        }
    }
    
    private func setConstaints() {
        
        beautifulview.snp.makeConstraints {
            $0.width.equalTo(124)
            $0.height.equalTo(165)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(140)
            $0.leading.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-11)
        }
    }
        
    public func mustitemconfigure(model: MustItemModel) {
        
        self.loadImage(from : model.image)
        self.nameLabel.text = model.name
    }
        
}
