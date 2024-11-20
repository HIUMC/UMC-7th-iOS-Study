//
//  SearchTableViewCell.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.20.
//

import UIKit
import SnapKit

class SearchTableViewCell: UITableViewCell {
    
    static let identifier: String = "SearchTableViewCell"
    
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
        addComponents()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        lbTitle.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(lbTitle)
        
        lbTitle.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(15)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    public lazy var lbTitle: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        
        return label
    }()
}
