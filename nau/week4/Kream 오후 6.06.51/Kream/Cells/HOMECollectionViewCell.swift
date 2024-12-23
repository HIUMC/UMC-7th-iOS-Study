//
//  HOMECollectionViewCell.swift
//  Kream
//
//  Created by KoNangYeon on 10/31/24.
//

import UIKit

class HOMECollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HOMECollectionViewCell"
    
    let imageView = UIImageView().then{
        $0.contentMode = .scaleAspectFit
    }
    
    let titleLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 11.5, weight: .light)
        $0.textColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints{
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.width.equalTo(61)
        }
        
        titleLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}
