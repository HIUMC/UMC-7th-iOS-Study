//
//  SearchView.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.01.
//

import UIKit

class SearchView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        tfSearch.becomeFirstResponder()
    }
    
    private func addComponents() {
        self.addSubview(tfSearch)
        
        tfSearch.snp.makeConstraints({
            $0.top.equalTo(safeAreaLayoutGuide).offset(6)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        })
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var tfSearch: UITextField = {
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
    
}
