//
//  SearchResultTableViewCell.swift
//  KreamClone
//
//  Created by 이현주 on 11/25/24.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    public lazy var result: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        l.textColor = UIColor(hex: "#1F1F1F")
        return l
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
        self.result.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        addSubview(result)
        
        result.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
        }
    }
    
    public func configure(model: SearchResponse) {
        result.text = model.title
    }
}
