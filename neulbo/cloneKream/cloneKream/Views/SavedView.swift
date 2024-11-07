//
//  Saved.swift
//  cloneKream
//
//  Created by 김서현 on 10/30/24.
//

import UIKit

class SavedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var title = UILabel().then {
        $0.text = "Saved"
        $0.font = .systemFont(ofSize: 28, weight: .semibold)
        $0.textColor = .black
    }
    
    private lazy var countLabel = UILabel().then {
        $0.text = "전체 \(SavedModel.dummy().count)개"
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .black
    }
    
    
    public lazy var tableView = UITableView().then {
        $0.register(SavedTableViewCell.self, forCellReuseIdentifier: SavedTableViewCell.identifier)
        $0.separatorStyle = .singleLine
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 102
    }
    
    private func setUpView() {
        self.addSubview(title)
        self.addSubview(countLabel)
        self.addSubview(tableView)
        
        title.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(15)
            $0.leading.equalToSuperview().inset(15)
        }
        
        countLabel.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(15)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(countLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
}
