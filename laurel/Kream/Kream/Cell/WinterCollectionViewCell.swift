//
//  WinterCollectionViewCell.swift
//  Kream
//
//  Created by 어진 on 11/18/24.
//

import UIKit
import SnapKit

class WinterCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "WinterCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10 // 이미지 둥글게
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
            make.edges.equalToSuperview()
        }
    }
    
    func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}
