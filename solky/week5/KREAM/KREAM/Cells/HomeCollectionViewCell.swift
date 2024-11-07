//
//  HomeCollectionViewCell.swift
//  KREAM
//
//  Created by 이태림 on 10/31/24.
//

import UIKit
import SnapKit
import Then

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageview = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = $0.frame.height / 2
        $0.clipsToBounds = true
    }
    
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 11.5, weight: .light)
        $0.textColor = .black
        $0.text = "색다른 추천"
    }
    
    private func setViews() {
        addSubview(imageview)
        addSubview(titleLabel)
    }
    
    private func setConstaints() {
        
        imageview.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(61)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageview.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
    }
}
