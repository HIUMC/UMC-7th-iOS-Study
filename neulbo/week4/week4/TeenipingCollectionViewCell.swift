//
//  TeenipingCollectionViewCell.swift
//  week4
//
//  Created by 김서현 on 10/29/24.
//

import UIKit

class TeenipingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TeenipingCollectionViewCell"
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .semibold)
        $0.textColor = .black
        $0.text = "티니핑"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.8333)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(10)
        }
    }
}
