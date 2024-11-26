//
//  ChallengeCollectionViewCell.swift
//  cloneKream
//
//  Created by 김서현 on 11/4/24.
//

import UIKit

class ChallengeCollectionViewCell: UICollectionViewCell {
    static let identifier = "ChallengeCollectionViewCell"
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    let userId = UILabel().then {
        $0.text = "@tokkislove"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        addSubview(imageView)
        addSubview(userId)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(124)
            $0.height.equalTo(165)
        }
        
        userId.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(13)
        }
        
    }
    
    public func loadImage(from url: String) {
        if let imageURL = URL(string: url) {
            imageView.kf.setImage(with: imageURL)
        }
    }

}

    


