//
//  ClickedTagSearchViewController.swift
//  Kream
//
//  Created by 어진 on 11/25/24.
//

import UIKit

class ClickedTagSearchViewController: UIViewController {

    // MARK: - UI Components
    private let backButton = UIButton(type: .system).then {
        let configuration = UIImage.SymbolConfiguration(pointSize: 16, weight: .medium)
        let backImage = UIImage(systemName: "chevron.left", withConfiguration: configuration)
        $0.setImage(backImage, for: .normal)
        $0.tintColor = .gray
        $0.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }

    private let searchBar = UISearchBar().then {
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.searchBarStyle = .minimal
    }

    private let cancelButton = UIButton(type: .system).then {
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }

    private let tableView = UITableView().then {
        $0.isHidden = true
        $0.tableFooterView = UIView()
    }

    // MARK: - Data
    private var results: [Product] = []

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupConstraints()
        setupTableView()
        setupSearchBarDelegate()
    }

    // MARK: - Setup Methods
    private func setupUI() {
        view.addSubview(backButton)
        view.addSubview(searchBar)
        view.addSubview(cancelButton)
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalTo(searchBar)
        }

        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.equalTo(backButton.snp.trailing).offset(8)
            $0.trailing.equalTo(cancelButton.snp.leading).offset(-8)
        }

        cancelButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalTo(searchBar)
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ResultCell")
    }

    private func setupSearchBarDelegate() {
        searchBar.delegate = self
    }

    // MARK: - Actions
    @objc private func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

    @objc private func cancelButtonTapped() {
        searchBar.resignFirstResponder()
    }

    // MARK: - API Call
    private func fetchSearchResults(query: String) {
        ProductService.shared.searchProducts(query: query) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let products):
                self.results = products
                self.tableView.isHidden = self.results.isEmpty
                self.tableView.reloadData()
            case .failure(let error):
                print("Fetch Error: \(error)")
            }
        }
    }
}

// MARK: - UISearchBarDelegate
extension ClickedTagSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            results.removeAll()
            tableView.isHidden = true
            tableView.reloadData()
        } else {
            fetchSearchResults(query: searchText)
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ClickedTagSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        cell.textLabel?.text = results[indexPath.row].name
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.textLabel?.textColor = .black
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Selected item: \(results[indexPath.row].name)")
    }
}
