//
//  Dice.swift
//  project33
//
//  Created by KoNangYeon on 10/13/24.
//

import UIKit
import SnapKit
import Then

class DiceView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setConstaints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private lazy var title = UILabel().then() {
        $0.text = "주사위 테이블 뷰 만들기"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = UIColor.black
    }
        
    public lazy var tableView = UITableView().then() {
        $0.register(DiceCell.self, forCellReuseIdentifier: DiceCell.identifier)
        $0.separatorStyle = .singleLine
    }
        
    private func setViews() {
        self.addSubview(title)
        self.addSubview(tableView)
    }
        
    private func setConstaints() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.left.equalToSuperview().offset(12)
            $0.right.equalToSuperview().offset(-183)
            $0.height.equalTo(24)
        }
            
        tableView.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(14)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}
