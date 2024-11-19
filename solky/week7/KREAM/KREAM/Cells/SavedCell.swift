//
//  SavedCell.swift
//  KREAM
//
//  Created by 이태림 on 10/29/24.
//

import UIKit
import SnapKit
import Then

class SavedCell: UITableViewCell {
    
    static let identifier = "SavedCell"
    
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
        self.setViews()
        self.setConstaints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.savedImageView.image = nil
        self.savedTitle.text = nil
        self.savedExplain.text = nil
        self.savedScrapButton.setImage(nil, for: .normal)
        self.savedPrice.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var savedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
        
    private lazy var savedTitle = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
        
    private lazy var savedExplain = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        $0.textColor = UIColor(red: 0.63, green: 0.63, blue: 0.63, alpha: 1.00)
        $0.numberOfLines = 0
    }
    
    private lazy var savedPrice = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    private lazy var savedScrapButton = UIButton().then {
        $0.setImage(UIImage(systemName: "scrapbutton"), for: .normal)
    }
    
    private func setViews() {
        self.addSubview(savedImageView)
        self.addSubview(savedTitle)
        self.addSubview(savedExplain)
        self.addSubview(savedPrice)
        self.addSubview(savedScrapButton)
    }
        
    private func setConstaints() {
        savedImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.leading.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().inset(14)
            $0.width.height.equalTo(72)
        }
            
        savedTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.leading.equalTo(savedImageView.snp.trailing).offset(13)
        }
        
        savedExplain.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.bottom.equalToSuperview().inset(34)
            $0.leading.equalTo(savedImageView.snp.trailing).offset(13)
        }
        
        savedScrapButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(14)
            $0.height.equalTo(18)
        }
        
        savedPrice.snp.makeConstraints {
            $0.top.equalTo(savedScrapButton.snp.bottom).offset(31)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(10)
            $0.height.equalTo(22)
        }
        
    }
    
    public func configure(model: SavedModel) {
        self.savedImageView.image = UIImage(named: model.savedImage)
        self.savedTitle.text = model.savedTitle
        self.savedExplain.text = model.savedExplain
        self.savedScrapButton.setImage(UIImage(named: model.savedScrapButton), for: .normal)
        self.savedPrice.text = model.savedPrice
    }
}
