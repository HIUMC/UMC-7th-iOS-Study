//
//  RecomWordCollectionViewCell.swift
//  KreamClone
//
//  Created by 이현주 on 11/24/24.
//

import UIKit

class RecomWordCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecomWordCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var searchWord: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 13.5, weight: .regular)
        l.textColor = UIColor(hex: "#050505")
        return l
    }()
    
    private func setUpView() {
        
        contentView.backgroundColor = UIColor(hex: "#F6F6F6")
        contentView.layer.cornerRadius = 16
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor(hex: "#ECECEC")?.cgColor
        
        addSubview(searchWord)
        
        searchWord.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
