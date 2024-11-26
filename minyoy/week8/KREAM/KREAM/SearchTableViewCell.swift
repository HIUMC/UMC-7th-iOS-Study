//
//  SearchTableViewCell.swift
//  KREAM
//
//  Created by 주민영 on 11/20/24.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    static let identifier = "SearchTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 31, left: 0, bottom: 0, right: 0))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.title.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let title = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    private func setView() {
        contentView.addSubview(title)
        
        title.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(17)
        }
    }
    
    public func configure(model: SearchTitle) {
        self.title.text = model.title
    }
}
