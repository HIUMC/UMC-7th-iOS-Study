//
//  SizeCollectionViewCell.swift
//  KREAM
//
//  Created by 주민영 on 11/9/24.
//

import UIKit

class SizeCollectionViewCell: UICollectionViewCell {
    static let identifier = "UICollectionViewCell"
    var selectedTag: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            if (isSelected) {
                sizeBtn.configuration?.attributedSubtitle = AttributedString("360,000", attributes: AttributeContainer([
                    .font: UIFont.systemFont(ofSize: 12, weight: .semibold),
                    .foregroundColor: UIColor(red: 217/255, green: 90/255, blue: 93/255, alpha: 1),
                ]))
                sizeBtn.configuration?.background.strokeColor = .black
            } else {
                sizeBtn.configuration?.attributedSubtitle = AttributedString("360,000", attributes: AttributeContainer([
                    .font: UIFont.systemFont(ofSize: 12, weight: .regular),
                    .foregroundColor: UIColor(red: 217/255, green: 90/255, blue: 93/255, alpha: 1),
                ]))
                sizeBtn.configuration?.background.strokeColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
            }
        }
    }
    
    public lazy var sizeBtn: UIButton = {
        let btn = UIButton()
        
        var config = UIButton.Configuration.plain()
        
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        config.cornerStyle = .medium
        
        config.attributedTitle = AttributedString("S", attributes: AttributeContainer([
            .font: UIFont.systemFont(ofSize: 14, weight: isSelected ? .semibold : .regular),
            .foregroundColor: UIColor.black,
        ]))
        config.attributedSubtitle = AttributedString("360,000", attributes: AttributeContainer([
            .font: UIFont.systemFont(ofSize: 12, weight: isSelected ? .semibold : .regular),
            .foregroundColor: UIColor(red: 217/255, green: 90/255, blue: 93/255, alpha: 1),
        ]))
        config.titleAlignment = .center
        config.titlePadding = 0
        
        config.background.strokeColor = isSelected ? .black : UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        config.background.strokeWidth = 1
        
        btn.configuration = config
        btn.isUserInteractionEnabled = false
        
        return btn
    }()
    
    private func setupView() {
        addSubview(sizeBtn)
        
        sizeBtn.snp.makeConstraints {
            $0.width.equalTo(110)
            $0.height.equalTo(47)
            $0.edges.equalToSuperview()
        }
    }
}
