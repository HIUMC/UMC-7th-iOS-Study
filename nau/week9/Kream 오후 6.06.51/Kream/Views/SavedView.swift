//
//  ProductCellView.swift
//  Kream
//
//  Created by KoNangYeon on 10/22/24.
//

import UIKit
import Then
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
    
    public lazy var title = Label(title: "Saved", size: 28, weight: .semibold)
    
    public lazy var count = Label(title: "전체 10개", size: 14, weight: .regular)
    
    public lazy var tableView = UITableView().then() {
        $0.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
        $0.separatorStyle = .singleLine
    }
    
    private func setViews() {
        [
            title, count, tableView
        ].forEach{
            addSubview($0)
        }
    }
    
    private func setConstaints() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().inset(61)
            $0.left.equalToSuperview().inset(10)
        }
        
        count.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(16)
            $0.left.equalToSuperview().inset(13)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(count.snp.bottom).offset(12)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}
