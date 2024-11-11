//
//  ProductSizeCollectionViewCell.swift
//  cloneKream
//
//  Created by 김서현 on 11/11/24.
//

import UIKit

class ProductSizeCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductSizeCollectionViewCell"
    
    
    lazy var button = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1).cgColor
        $0.isUserInteractionEnabled = false
    }
    
    lazy var sizeLabel = UILabel().then {
        $0.text = "S"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .regular)
    }
    
    lazy var priceLabel = UILabel().then {
        $0.text = "360,000"
        $0.textColor = UIColor(red: 217/255, green: 90/255, blue: 93/255, alpha: 1)
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    private lazy var stack = UIStackView().then {
        $0.addArrangedSubview(sizeLabel)
        $0.addArrangedSubview(priceLabel)
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 3
    }
    
    /*override var isSelected: Bool {
        didSet{
            if isSelected {
                button.layer.borderColor = UIColor.black.cgColor
                sizeLabel.font = .systemFont(ofSize: 14, weight: .semibold)
                priceLabel.font = .systemFont(ofSize: 12, weight: .semibold)
                print("selected")
            }
            else {
                button.layer.borderColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1).cgColor
                sizeLabel.font = .systemFont(ofSize: 14, weight: .regular)
                priceLabel.font = .systemFont(ofSize: 12, weight: .regular)
            }
        }
    }*/
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(button)
        button.addSubview(stack)
        
        button.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(110)
            $0.height.equalTo(47)
        }
        
        stack.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func selected() {
        button.layer.borderColor = UIColor.black.cgColor
        sizeLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        priceLabel.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    
    func deselected() {
        button.layer.borderColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1).cgColor
        sizeLabel.font = .systemFont(ofSize: 14, weight: .regular)
        priceLabel.font = .systemFont(ofSize: 12, weight: .regular)
    }

}
