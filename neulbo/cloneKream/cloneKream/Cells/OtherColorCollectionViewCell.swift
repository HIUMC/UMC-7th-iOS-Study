//
//  OtherColorCollectionViewCell.swift
//  cloneKream
//
//  Created by 김서현 on 11/11/24.
//

import UIKit

class OtherColorCollectionViewCell: UICollectionViewCell {
    static let identifier = "OtherColorCollectionViewCell"
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(53)
            $0.height.equalTo(53)
        }
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
