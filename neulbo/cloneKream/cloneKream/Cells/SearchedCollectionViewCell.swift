//
//  SearchedCollectionViewCell.swift
//  cloneKream
//
//  Created by 김서현 on 11/25/24.
//

import UIKit

class SearchedCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchedCollectionViewCell"
    
    let title = UILabel().then {
        $0.font = .systemFont(ofSize: 13.5, weight: .regular)
        $0.textColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        setUpView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setUpView() {
        
        contentView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
            
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1).cgColor
            
        contentView.addSubview(title)
            
        title.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.edges.equalToSuperview().inset(11)
        }
            
    }
}
