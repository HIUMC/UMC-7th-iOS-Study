//
//  TeenipingCollectionViewCell.swift
//  TeeniepingCollection
//
//  Created by 이현주 on 10/30/24.
//

import UIKit
import SnapKit
import Then

class TeenipingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TeenipingCollectionViewCell"
    
    let image = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    let name = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        $0.textColor = .black
        $0.text = "티니핑"
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
            make.height.equalTo(120)
        }
        
        name.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(4)
            make.top.equalTo(image.snp.bottom).offset(12)
        }
    }
}
