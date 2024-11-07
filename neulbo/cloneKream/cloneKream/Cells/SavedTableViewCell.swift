//
//  SavedTableViewCell.swift
//  cloneKream
//
//  Created by 김서현 on 10/30/24.
//

import UIKit
import Then

class SavedTableViewCell: UITableViewCell {
    
    static let identifier = "SavedTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUpView()
    }
        
    override func prepareForReuse() {
        super.prepareForReuse()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var savedImage = UIImageView().then {
        $0.image = UIImage(named: "image1")
        $0.layer.cornerRadius = 10
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.setContentCompressionResistancePriority(.required, for: .vertical)
        $0.setContentHuggingPriority(.required, for: .vertical)
    }
    
    private lazy var savedTitle = UILabel().then {
        $0.text = "손오공 어쩌구"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    
    private lazy var explanation = UILabel().then {
        $0.text = "손오공이 장난치다가~~"
        $0.numberOfLines = 0
        $0.textColor = UIColor(red: 161/255, green: 161/255, blue: 161/255, alpha: 1)
        $0.font = .systemFont(ofSize: 9, weight: .medium)
    }
    
    private lazy var textStack = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.addArrangedSubview(savedTitle)
        $0.addArrangedSubview(explanation)
        $0.spacing = 5
    }
    
    private lazy var priceLabel = UILabel().then {
        $0.text = "12221원"
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    private lazy var savedButton = UIButton().then {
        $0.setImage(UIImage(named: "saved.fill"), for: .normal)
    }
    
    private func setUpView() {
        addSubview(savedImage)
        addSubview(textStack)
        addSubview(priceLabel)
        addSubview(savedButton)
        
        savedImage.snp.makeConstraints {
            $0.width.height.equalTo(72)
            $0.top.equalToSuperview().offset(15)
            $0.bottom.lessThanOrEqualToSuperview().offset(-15)
            $0.leading.equalToSuperview().inset(13)
            $0.centerY.equalToSuperview()
        }
        
        textStack.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(savedImage.snp.trailing).offset(13)
            $0.trailing.equalToSuperview().inset(13)
        }
        
        priceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(13)
            $0.bottom.equalToSuperview().inset(13)
        }
        
        savedButton.snp.makeConstraints {
            $0.top.equalTo(textStack.snp.top).offset(-5)
            $0.trailing.equalToSuperview().inset(13)
        }
    }
    
    public func configure(model: SavedModel) {
        self.savedImage.image = model.image
        self.savedTitle.text = model.name
        self.explanation.text = model.explanation
        self.priceLabel.text = "\(model.price)원"
    }
    

}
