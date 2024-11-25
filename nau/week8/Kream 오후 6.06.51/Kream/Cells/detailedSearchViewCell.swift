//
//  detailedSearchViewCell.swift
//  Kream
//
//  Created by KoNangYeon on 11/22/24.
//

import UIKit

class detailedSearchViewCell: UITableViewCell {
    
    static let identifier = "detailedSearchViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var title = Label(title: "", size: 14, weight: .semibold)
    
    private func setupView() {
        self.addSubview(title)
        
        title.snp.makeConstraints{
            $0.verticalEdges.equalTo(safeAreaLayoutGuide)
            $0.left.equalTo(safeAreaLayoutGuide)
        }
    }
}
