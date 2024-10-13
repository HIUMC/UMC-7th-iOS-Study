//
//  SavedView.swift
//  MyKream
//
//  Created by 김호성 on 2024.10.13.
//

import UIKit
import SnapKit

class SavedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(lbTitle)
        self.addSubview(lbCount)
        self.addSubview(tableView)
        
        lbTitle.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(16)
            $0.leading.equalToSuperview().inset(10)
            $0.height.equalTo(45)
        }
        lbCount.snp.makeConstraints {
            $0.top.equalTo(lbTitle.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(13)
            $0.height.equalTo(22)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(lbCount.snp.bottom).offset(12)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private lazy var lbTitle: UILabel = {
        let label = UILabel()
        
        label.text = "Saved"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var lbCount: UILabel = {
        let label = UILabel()
        
        label.text = "전체 \(DummySavedModel.savedDatas.count)개"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        
        return label
    }()
    
    public lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(SavedTableViewCell.self, forCellReuseIdentifier: SavedTableViewCell.identifier)
        table.separatorStyle = .singleLine
        return table
    }()
}
