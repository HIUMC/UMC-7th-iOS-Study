//
//  SearchRecCollectionViewCell.swift
//  KREAM
//
//  Created by 주민영 on 11/20/24.
//

import UIKit

class SearchRecCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchRecCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let recBox = UIView().then {
        $0.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = CGColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1)
    }
    
    let recLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13.5, weight: .regular)
        $0.textColor = .black
        $0.text = ""
        $0.numberOfLines = 1
    }
    
    private func setupView() {
        recBox.addSubview(recLabel)
        addSubview(recBox)
        
        recBox.sizeToFit()
        
        recBox.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.edges.equalToSuperview()
        }
        
        recLabel.snp.makeConstraints {
            $0.leading.equalTo(recBox.snp.leading).offset(11)
            $0.trailing.equalTo(recBox.snp.trailing).offset(-11)
            $0.top.equalTo(recBox.snp.top).offset(8)
            $0.bottom.equalTo(recBox.snp.bottom).offset(-8)
        }
    }
}
