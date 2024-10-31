//
//  SavedView.swift
//  KREAM
//
//  Created by 주민영 on 10/13/24.
//

import UIKit
import SnapKit

class SavedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        label.textColor = UIColor.black
        return label
    }()
    
    public lazy var productNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        return label
    }()
    
    public lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
        table.separatorStyle = .singleLine
        return table
    }()
    
    private func setViews() {
        self.addSubview(title)
        self.addSubview(productNumberLabel)
        self.addSubview(tableView)
    }
    
    private func setConstaints() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(302)
        }
        
        productNumberLabel.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(13)
            $0.right.equalToSuperview().offset(325)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(productNumberLabel.snp.bottom).offset(12)
            $0.left.right.bottom.equalToSuperview()
        }
    }

}
