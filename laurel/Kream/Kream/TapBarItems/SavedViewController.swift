//
//  SavedViewController.swift
//  Kream
//
//  Created by 어진 on 10/9/24.
//

import UIKit
import SnapKit

class SavedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    // 상단 제목 레이블
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    // 전체 항목 수 레이블
    private let itemCountLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 10개"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SavedTableViewCell.self, forCellReuseIdentifier: SavedTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    private let savedItems = DummySavedData.savedItems
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Saved"
        
        setupScrollView()
        setupLabels()
        setupTableView()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
    }
    
    private func setupLabels() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(itemCountLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(20)
            make.leading.equalTo(contentView).offset(20)
        }
        
        itemCountLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalTo(titleLabel)
        }
    }
    
    private func setupTableView() {
        contentView.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // 테이블 뷰 제약 설정
        tableView.snp.makeConstraints { make in
            make.top.equalTo(itemCountLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(CGFloat(savedItems.count) * 80)
            make.bottom.equalToSuperview()
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedTableViewCell.identifier, for: indexPath) as? SavedTableViewCell else {
            return UITableViewCell()
        }
        
        let item = savedItems[indexPath.row]
        cell.configure(with: item)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
