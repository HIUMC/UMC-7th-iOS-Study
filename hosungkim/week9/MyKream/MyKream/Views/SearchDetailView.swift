//
//  SearchDetailView.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.20.
//

import UIKit

class SearchDetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        tfSearch.becomeFirstResponder()
    }
    
    private func addComponents() {
        self.addSubview(btnBack)
        self.addSubview(tfSearch)
        self.addSubview(btnCancel)
        self.addSubview(tableView)
        
        btnBack.snp.makeConstraints({
            $0.width.equalTo(24)
            $0.centerY.equalTo(tfSearch)
            $0.leading.equalToSuperview().inset(15)
            
        })
        tfSearch.snp.makeConstraints({
            $0.leading.equalTo(btnBack.snp.trailing).offset(15)
            $0.top.equalTo(safeAreaLayoutGuide).offset(6)
            $0.height.equalTo(40)
        })
        btnCancel.snp.makeConstraints({
            $0.width.equalTo(40)
            $0.centerY.equalTo(tfSearch)
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(tfSearch.snp.trailing).offset(11)
        })
        tableView.snp.makeConstraints({
            $0.top.equalTo(tfSearch.snp.bottom).offset(31)
            $0.leading.trailing.bottom.equalToSuperview().inset(16)
        })
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var btnBack: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(resource: .iconArrowBack), for: .normal)
        return button
    }()

    public lazy var tfSearch: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "브랜드, 상품, 프로필, 태그 등", attributes: [.foregroundColor: UIColor(red: 182/255, green: 182/255, blue: 182/255, alpha: 1)])
        textField.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        textField.layer.cornerRadius = 12
        textField.font = UIFont.systemFont(ofSize: 13.5)
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        
        return textField
    }()
    public lazy var btnCancel: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("취소", for: .normal)
        return button
    }()
    public lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        table.separatorStyle = .none
        return table
    }()
}
