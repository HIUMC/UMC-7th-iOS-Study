//
//  MenuCollectionViewCell.swift
//  MyKream
//
//  Created by 김호성 on 2024.10.30.
//

import UIKit
import SnapKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: MenuCollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        applyComponentStyles()
    }
    
    private func applyComponentStyles() {
        ivImage.layer.cornerRadius = ivImage.frame.width / 2
    }
    
    public lazy var ivImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    public lazy var lbTitle: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 11.5, weight: .light)
        label.textColor = .black
        
        return label
    }()
    
    private func setupView() {
        self.addSubview(ivImage)
        self.addSubview(lbTitle)
        
        ivImage.snp.makeConstraints({
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(61)
        })
        lbTitle.snp.makeConstraints({
            $0.top.equalTo(ivImage.snp.bottom).offset(6)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        })
    }
}
