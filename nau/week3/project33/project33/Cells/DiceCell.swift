//
//  DiceCell.swift
//  project33
//
//  Created by KoNangYeon on 10/13/24.
//

import UIKit
import Then
import SnapKit

class DiceCell: UITableViewCell {
    
    static let identifier = "DiceCell" //테이블뷰에서 cell 연결위한 식별자

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
        self.diceImageView.image = nil
        self.diceName.text = nil
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private lazy var diceImageView = UIImageView().then() {_ in}
        
    private lazy var diceName = UILabel().then() {
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = UIColor.black
    }
        
    private func setViews() {
        self.addSubview(diceImageView)
        self.addSubview(diceName)
    }
        
    private func setConstaints() {
        diceImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.left.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().offset(-10)
            $0.width.height.equalTo(75)
        }
            
        diceName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(36.5)
            $0.left.equalTo(diceImageView.snp.right).offset(87)
            $0.right.equalToSuperview().offset(-144)
        }
    }
        
    public func configure(model: DiceModel) {
        self.diceImageView.image = UIImage(named: model.diceImage)
        self.diceName.text = model.diceName
    }

}
