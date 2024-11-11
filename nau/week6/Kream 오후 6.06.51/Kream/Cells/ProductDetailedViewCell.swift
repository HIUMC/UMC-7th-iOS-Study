//
//  ProductDetailedViewCell.swift
//  Kream
//
//  Created by KoNangYeon on 11/9/24.
//

import UIKit
import Then
import SnapKit

class ProductDetailedViewCell: UICollectionViewCell {
    
    static let identifier = "ProductDetailedViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private func setupView() {
        addSubview(imageView)
        
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
