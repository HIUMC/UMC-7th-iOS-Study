//
//  ChallengeCollectionViewCell.swift
//  KreamClone
//
//  Created by 이현주 on 11/4/24.
//

import UIKit

class ChallengeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ChallengeCollectionViewCell"
    
    public lazy var image: UIImageView = {
        let i = UIImageView()
        i.layer.cornerRadius = 8
        i.layer.masksToBounds = true
        i.contentMode = .scaleAspectFill
        return i
    }()
    
    public lazy var id: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 12, weight: .regular)
        l.textColor = .white
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
        self.id.text = nil
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func loadImage(from url: String) {
        if let imageURL = URL(string: url) {
            image.kf.setImage(with: imageURL)
        }
    }
    
    private func setUpView() {
        addSubview(image)
        image.addSubview(id)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(124)
            make.height.equalTo(165)
        }
        
        id.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(11)
            make.leading.equalToSuperview().offset(10)
        }
    }
}
