//
//  ImageCollectionViewCell.swift
//  KREAM
//
//  Created by 주민영 on 11/5/24.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public let image = UIImageView().then {
        $0.image = UIImage(named: "image_card_1")
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    public let usernameLabel = UILabel().then {
        $0.text = "@katarinabluu"
        $0.textColor = .white
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    private func setupView() {
        addSubview(image)
        addSubview(usernameLabel)
        
        image.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(124)
            $0.height.equalTo(165)
        }
        
        usernameLabel.snp.makeConstraints {
            $0.leading.equalTo(image.snp.leading).inset(10)
            $0.bottom.equalTo(image.snp.bottom).inset(11)
        }
    }
}
