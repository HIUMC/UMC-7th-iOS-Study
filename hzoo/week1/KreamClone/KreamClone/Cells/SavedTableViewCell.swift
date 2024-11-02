//
//  SavedTableViewCell.swift
//  KreamClone
//
//  Created by 이현주 on 10/29/24.
//

import UIKit
import SnapKit
import Then

class SavedTableViewCell: UITableViewCell {
    
    public var amount = "0"
    
    private lazy var image: UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFill
        i.layer.cornerRadius = 10
        i.layer.masksToBounds = true
        return i
    }()
    
    private lazy var name: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = .systemFont(ofSize: 12, weight: .semibold)
        return l
    }()
    
    private lazy var contents: UILabel = {
        let l = UILabel()
        l.textColor = UIColor(hex: "#A1A1A1")
        l.font = .systemFont(ofSize: 9, weight: .medium)
        l.numberOfLines = 2
        return l
    }()
    
    private lazy var won: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = .systemFont(ofSize: 14, weight: .semibold)
        return l
    }()
    
    private lazy var savedBtn: UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        b.setImage(UIImage(named: "savedIcon"), for: .normal)
        return b
    }()

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
        setUpUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
        self.name.text = nil
        self.contents.text = nil
        self.won.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        self.addSubview(image)
        self.addSubview(name)
        self.addSubview(contents)
        self.addSubview(won)
        self.addSubview(savedBtn)
        
        image.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().inset(14)
            $0.width.height.equalTo(72)
        }
        
        name.snp.makeConstraints {
            $0.top.equalTo(image.snp.top)
            $0.leading.equalTo(image.snp.trailing).offset(13)
        }
        
        contents.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).offset(5)
            $0.leading.equalTo(name.snp.leading)
            $0.width.equalTo(153)
        }
        
        won.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-10)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        savedBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().offset(-17)
        }
    }
    
    public func configure(model: SavedModel) {
        image.image = UIImage(named: model.savedName)
        name.text = model.savedName
        contents.text = model.savedContents
        amount = model.savedAmount
        won.text = "\(amount)원"
    }
}
