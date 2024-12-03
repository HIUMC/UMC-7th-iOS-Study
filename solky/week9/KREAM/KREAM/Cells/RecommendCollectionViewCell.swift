//
//  RecommendCollectionViewCell.swift
//  KREAM
//
//  Created by 이태림 on 11/25/24.
//

import UIKit
import SnapKit
import Then

class RecommendCollectionViewCell: UICollectionViewCell {
    static let identifier = "RecommendCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backgroundview = UIView().then {
        $0.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00).cgColor
        $0.layer.cornerRadius = 20
    }
    
    public lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13.5, weight: .regular)
        $0.textColor = UIColor(red: 0.02, green: 0.02, blue: 0.02, alpha: 1.00)
        $0.text = "채원 슈프림 후리스"
        $0.numberOfLines = 1
    }
    
    private func setViews() {
        
        addSubview(backgroundview)
        backgroundview.addSubview(titleLabel)
        
    }
    
    private func setConstaints() {
        
        backgroundview.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(backgroundview.snp.leading).offset(11)
            $0.trailing.equalTo(backgroundview.snp.trailing).offset(-11)
            $0.top.equalTo(backgroundview.snp.top).offset(8)
            $0.bottom.equalTo(backgroundview.snp.bottom).offset(-8)
        }
    }
}
