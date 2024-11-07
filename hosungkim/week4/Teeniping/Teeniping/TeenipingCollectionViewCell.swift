//
//  TeenipingCollectionViewCell.swift
//  Teeniping
//
//  Created by 김호성 on 2024.10.29.
//

import UIKit
import SnapKit

class TeenipingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: TeenipingCollectionViewCell.self)
    
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
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    public lazy var lbTitle: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .black
        label.text = "티니핑"
        
        return label
    }()
    
    private func setupView() {
        self.addSubview(ivImage)
        self.addSubview(lbTitle)
        
        ivImage.snp.makeConstraints({
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(120)
        })
        lbTitle.snp.makeConstraints({
            $0.top.equalTo(ivImage.snp.bottom).offset(12)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(4)
        })
    }
}
