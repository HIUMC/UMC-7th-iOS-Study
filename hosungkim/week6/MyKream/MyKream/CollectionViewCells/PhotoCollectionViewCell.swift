//
//  PhotoCollectionViewCell.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.03.
//

import UIKit
import SnapKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: PhotoCollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var ivPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    public lazy var lbTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    private func setupView() {
        self.addSubview(ivPhoto)
        self.addSubview(lbTitle)
        
        ivPhoto.snp.makeConstraints({
            $0.edges.equalToSuperview()
            $0.width.equalTo(124)
            $0.height.equalTo(165)
        })
        lbTitle.snp.makeConstraints({
            $0.leading.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(11)
        })
    }
}
