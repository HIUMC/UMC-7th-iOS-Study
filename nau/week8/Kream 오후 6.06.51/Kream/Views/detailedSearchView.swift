//
//  detailedSearchView.swift
//  Kream
//
//  Created by KoNangYeon on 11/21/24.
//

import UIKit

class detailedSearchView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    
        addStack()
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var backBtn = profileModifyView().backBtn
    
    //lazy var searchBar = searchView().searchBar
    
    //lazy var btn = searchView().btn
    
    lazy var searchStack = searchView().searchStack
    
    lazy var line = HOMEView().divideLine
    
    public lazy var tableView = UITableView().then() {
        $0.register(detailedSearchViewCell.self, forCellReuseIdentifier: detailedSearchViewCell.identifier)
        $0.separatorStyle = .none
        $0.rowHeight = 31
    }
    
    private func addStack() {
        [backBtn].forEach{searchStack.insertArrangedSubview($0, at: 0)}
    }
    
    private func setupView() {
        [searchStack, line, tableView].forEach{addSubview($0)}
        
        searchStack.snp.makeConstraints{
            $0.top.equalTo(safeAreaLayoutGuide).inset(7)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(39)
        }
        
        line.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(searchStack.snp.bottom).offset(11)
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(searchStack.snp.bottom).offset(31)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }
}
