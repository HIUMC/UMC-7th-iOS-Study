//
//  HOMECollectionViewCell.swift
//  Kream
//
//  Created by KoNangYeon on 10/31/24.
//

import UIKit
import Then
import SnapKit
import Kingfisher

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

class HOMECollectionViewCell2 : UICollectionViewCell {
    
    static let identifier = "HOMECollectionViewCell2"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView() {
        [
            backView,
            image,
            title,
            smallTitle,
            counts,
            price,
            savedBtn,
            realPrice
        ].forEach{
            addSubview($0)
        }
        
        backView.snp.makeConstraints{
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(142)
        }
        
        image.snp.makeConstraints{
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(142)
        }
        
        title.snp.makeConstraints{
            $0.top.equalTo(image.snp.bottom).offset(8)
            $0.left.equalToSuperview().inset(4)
        }
        
        smallTitle.snp.makeConstraints{
            $0.top.equalTo(title.snp.bottom).offset(3)
            $0.left.equalToSuperview().inset(4)
            $0.width.equalTo(136)
        }
        
        counts.snp.makeConstraints{
            $0.top.equalToSuperview().inset(8)
            $0.right.equalToSuperview().inset(8)
        }
        
        realPrice.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview().inset(4)
        }
        
        price.snp.makeConstraints{
            $0.bottom.equalTo(realPrice.snp.top).offset(-2)
            $0.left.equalToSuperview().inset(4)
        }
        
        savedBtn.snp.makeConstraints{
            $0.bottom.equalTo(image.snp.bottom).offset(-10)
            $0.right.equalToSuperview().inset(10)
            $0.height.equalTo(22)
            $0.width.equalTo(20)
        }
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backView = UIView().then {
        $0.layer.cornerRadius = 14
    }
    
    let image = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 14
    }
    
    let title = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .black
    }
    
    let smallTitle = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    let counts = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        $0.textColor = .black
    }
    
    let price = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        $0.textColor = .black
    }

    let savedBtn = UIButton().then {
        $0.setImage(.notsaved, for: .normal)
        $0.addTarget(HOMECollectionViewCell2.self, action: #selector(savedBtnDidTap(_:)), for: .touchUpInside)
    }
    
    @objc
    private func savedBtnDidTap(_ sender: UIButton){
        sender.isSelected.toggle()
        
        if sender.isSelected {
            sender.setImage(.saved, for: .selected)
            } else {
                sender.setImage(.notsaved, for: .normal)
        }
    }
    
    let realPrice = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 10, weight: .light)
        $0.textColor = UIColor(hue: 0, saturation: 0, brightness: 0.63, alpha: 1.0)
    }
}

class HOMECollectionViewCell3: UICollectionViewCell {
    
    static let identifier = "HOMECollectionViewCell3"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let image = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true // 이거해야 radius적용되네
    }
    
    let instaId = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .white
    }
    
    private func setupView() {
        addSubview(image)
        addSubview(instaId)
        
        image.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.height.equalTo(165)
            $0.width.equalTo(124)
        }
        
        instaId.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(11)
            $0.left.equalToSuperview().inset(10)
        }
    }
}
