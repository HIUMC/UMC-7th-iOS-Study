//
//  SearchDetailView.swift
//  KreamClone
//
//  Created by 이현주 on 11/25/24.
//

import UIKit

class SearchDetailView: UIView {
    
    public lazy var backBtn: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "icon_arrow_back"), for: .normal)
        b.backgroundColor = .clear
        return b
    }()

    public lazy var searchBar: UITextField = {
        let t = UITextField()
        t.attributedPlaceholder = NSAttributedString(string: "브랜드, 상품, 프로필, 태그 등", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "#B6B6B6") ?? .gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13.5, weight: .regular)])
        t.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        t.leftViewMode = .always
        t.layer.cornerRadius = 12
        t.contentHorizontalAlignment = .left // 버튼 전체의 내용 정렬을 왼쪽으로 설정
        t.layer.masksToBounds = true
        t.backgroundColor = UIColor(hex: "#F5F5F5")
        return t
    }()
    
    public lazy var cancelBtn: UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14, weight: .medium),
            .foregroundColor: UIColor(hex: "#212121") ?? .black
        ]
        let attributedTitle = NSAttributedString(
            string: "취소",
            attributes: attributes
        )
        b.setAttributedTitle(attributedTitle, for: .normal)
        return b
    }()
    
    public lazy var searchResultTableView: UITableView = {
        let t = UITableView()
        t.register(SearchResultTableViewCell.self, forCellReuseIdentifier: "SearchResultTableViewCell")
        t.separatorStyle = .none
        return t
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        self.constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addComponents() {
        [backBtn, searchBar, cancelBtn, searchResultTableView].forEach{ self.addSubview($0) }
    }
    
    private func constraints() {
        
        backBtn.snp.makeConstraints { make in
            make.centerY.equalTo(searchBar)
            make.leading.equalTo(safeAreaLayoutGuide).offset(15)
            make.width.height.equalTo(24)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(6)
            make.leading.equalTo(backBtn.snp.trailing).offset(15)
            make.trailing.equalTo(cancelBtn.snp.leading).offset(-11)
            make.height.equalTo(40)
        }
        
        cancelBtn.snp.makeConstraints { make in
            make.centerY.equalTo(searchBar)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(22)
        }
        
        searchResultTableView.snp.makeConstraints { make in
            make.top.equalTo(cancelBtn.snp.bottom).offset(15.5)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
