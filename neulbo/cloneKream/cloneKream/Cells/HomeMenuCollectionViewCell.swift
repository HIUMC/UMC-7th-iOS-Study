//
//  HomeMenuCollectionViewCell.swift
//  cloneKream
//
//  Created by 김서현 on 10/31/24.
//

import UIKit

class HomeMenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeMenuCollectionViewCell"
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
    }
    
    let menu = UILabel().then {
        $0.text = "실시간 차트"
        $0.font = .systemFont(ofSize: 11.5, weight: .light)
        $0.textColor = .black
    }
    
    private lazy var stack = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.addArrangedSubview(imageView)
        $0.addArrangedSubview(menu)
        $0.spacing = 5
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        addSubview(stack)
        
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(61)
        }
        
        
        stack.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
