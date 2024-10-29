//
//  SavedView.swift
//  KREAM
//
//  Created by 이태림 on 10/29/24.
//

import UIKit
import SnapKit
import Then

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
    
    private lazy var title = UILabel().then {
        $0.text = "Saved"
        $0.font = UIFont.systemFont(ofSize: 28, weight: .medium)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    private lazy var mount = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .light)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    public func dataCount(_ count: Int) {
        mount.text = "전체 \(count)개"
    }
    
    public lazy var tableView = UITableView().then {
        $0.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        $0.separatorStyle = .singleLine
        $0.separatorColor = UIColor(red: 0.84, green: 0.84, blue: 0.84, alpha: 1.00)
        $0.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    private func setViews() {
        self.addSubview(title)
        self.addSubview(mount)
        self.addSubview(tableView)
    }
    
    private func setConstaints() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(45)
        }
        
        mount.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(13)
            $0.height.equalTo(22)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(mount.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(90)
        }
    }
}

