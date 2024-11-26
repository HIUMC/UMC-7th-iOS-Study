//
//  HomeMenuCollectionViewCell.swift
//  KreamClone
//
//  Created by 이현주 on 10/31/24.
//

import UIKit

class HomeMenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeMenuCollectionViewCell"
    
    public lazy var image = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    public lazy var name = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 11.5, weight: .light)
        $0.textColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        addSubview(image)
        addSubview(name)
        
        image.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.width.equalTo(61)
        }
        
        name.snp.makeConstraints { make in
            make.centerX.equalTo(image)
            make.top.equalTo(image.snp.bottom).offset(6)
        }
    }
}
