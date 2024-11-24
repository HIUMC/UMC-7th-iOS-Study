//
//  DroppedCollectionViewCell.swift
//  KreamClone
//
//  Created by 이현주 on 11/4/24.
//

import UIKit

class DroppedCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DroppedCollectionViewCell"
    
    public lazy var image: UIImageView = {
        let i = UIImageView()
        i.layer.cornerRadius = 12
        i.layer.masksToBounds = true
        i.contentMode = .scaleAspectFill
        return i
    }()
    
    public lazy var trade: UILabel = {
        let l = UILabel()
        l.textColor = UIColor(hex: "#40454B")
        l.font = .systemFont(ofSize: 10, weight: .regular)
        return l
    }()
    
    public lazy var savedBtn: UIButton = {
        let b = UIButton(type: .custom)
        b.backgroundColor = .clear
        b.setImage(UIImage(named: "nSavedIcon"), for: .normal)
        b.addTarget(self, action: #selector(savedBtnTapped), for: .touchUpInside)
        return b
    }()
    
    @objc private func savedBtnTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
            
        // 버튼이 클릭될 때마다, 버튼 이미지를 변환
        if sender.isSelected {
            sender.setImage(UIImage(named: "savedIcon")?.withRenderingMode(.alwaysOriginal), for: .selected)
        } else {
            sender.setImage(UIImage(named: "nSavedIcon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
    }
    
    public lazy var brand: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = .systemFont(ofSize: 12, weight: .semibold)
        return l
    }()
    
    public lazy var name: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = .systemFont(ofSize: 12, weight: .light)
        l.numberOfLines = 2
        return l
    }()
    
    public lazy var price: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = .systemFont(ofSize: 13, weight: .semibold)
        return l
    }()
    
    public lazy var instant: UILabel = {
        let l = UILabel()
        l.text = "즉시 구매가"
        l.textColor = UIColor(hex: "#A2A2A2")
        l.font = .systemFont(ofSize: 10, weight: .light)
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
        self.trade.text = nil
        self.brand.text = nil
        self.name.text = nil
        self.price.text = nil
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        addSubview(image)
        image.addSubview(trade)
        addSubview(savedBtn)
        
        addSubview(brand)
        addSubview(name)
        addSubview(price)
        addSubview(instant)
        
        image.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.width.equalTo(142)
        }
        
        trade.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
        }
        
        savedBtn.snp.makeConstraints { make in
            make.bottom.trailing.equalTo(image).inset(10)
        }
        
        brand.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(4)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalTo(brand.snp.bottom).offset(3)
            make.leading.equalTo(brand.snp.leading)
            make.width.equalTo(124)
        }
        
        instant.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(brand.snp.leading)
        }
        
        price.snp.makeConstraints { make in
            make.bottom.equalTo(instant.snp.top).offset(-2)
            make.leading.equalTo(brand.snp.leading)
        }
    }
}
