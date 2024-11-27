//
//  MenuCollectionViewCell.swift
//  KREAM
//
//  Created by 주민영 on 10/28/24.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    static let identifier = "MenuCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 30
        $0.backgroundColor = .systemGray6
        $0.clipsToBounds = true
    }
    
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 11.5, weight: .light)
        $0.textColor = .black
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(61)
            $0.height.equalTo(61)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
    }
}
