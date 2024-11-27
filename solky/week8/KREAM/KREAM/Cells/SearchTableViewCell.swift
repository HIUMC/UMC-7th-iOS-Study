//
//  SearchTableViewCell.swift
//  KREAM
//
//  Created by 이태림 on 10/29/24.
//

import UIKit
import SnapKit
import Then

class SearchTableViewCell: UITableViewCell {
    
    static let identifier = "SearchTableViewCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 31, left: 0, bottom: 0, right: 0))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstaints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.searchTitle.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var searchTitle = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    private func setViews() {
        contentView.addSubview(searchTitle)
    }
    
    private func setConstaints() {
        
        searchTitle.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(17)
        }
    }
    
    public func configure(model: SearchResponse) {
        self.searchTitle.text = model.title
    }
}
