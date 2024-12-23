//
//  WinterCollectionViewCell.swift
//  Kream
//
//  Created by 어진 on 11/18/24.
//

import UIKit
import SnapKit
import Kingfisher

class WinterCollectionViewCell: UICollectionViewCell {
    static let identifier = "WinterCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.width.equalTo(124)
            make.height.equalTo(165)
            make.center.equalToSuperview()
        }
    }
    
    func configure(with model: WinterModel) {
        imageView.kf.setImage(with: URL(string: model.image))
    }
}
