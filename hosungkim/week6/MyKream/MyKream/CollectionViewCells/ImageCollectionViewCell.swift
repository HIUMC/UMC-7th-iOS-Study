//
//  ImageCollectionViewCell.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.10.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier: String = String(describing: ImageCollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var ivImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private func setupView() {
        self.addSubview(ivImage)
        
        ivImage.snp.makeConstraints({
            $0.edges.equalToSuperview()
            $0.width.equalTo(53)
            $0.height.equalTo(53)
        })
    }
}
