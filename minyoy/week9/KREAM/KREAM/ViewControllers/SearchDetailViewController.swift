//
//  SearchDetailViewController.swift
//  KREAM
//
//  Created by 주민영 on 11/20/24.
//

import UIKit
import Moya

class SearchDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let provider = MoyaProvider<UserTargetType>()
    var searchResults: [SearchTitle]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchDetailView
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
        setupDelegate()
    }
    
    private lazy var searchDetailView: SearchDetailView = {
        let view = SearchDetailView()
        view.previousBtn.addTarget(self, action: #selector(goSearchView), for: .touchUpInside)
        view.cancelBtn.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        return view
    }()
    
    private func setupDelegate() {
        searchDetailView.searchBar.delegate = self
        
        searchDetailView.titleTableView.delegate = self
        searchDetailView.titleTableView.dataSource = self
    }
    
    @objc private func goSearchView() {
        self.dismiss(animated: false)
    }
    
    @objc private func goHome() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: false)
    }
    
    private func getSearchInfo(query: String) {
        provider.request(.getProductTitle(query: query)) { result in
            switch result {
            case .success(let response):
                do {
                    let searchResponse = try response.map(SearchResponseModel.self).products
                    self.searchResults = searchResponse
                    
                    // 검색 결과가 없을 때 label 띄우기
                    if let searchResults = self.searchResults, !searchResults.isEmpty {
                        self.searchDetailView.titleTableView.isHidden = false
                        self.searchDetailView.emptyLabel.isHidden = true
                        self.searchDetailView.titleTableView.reloadData()
                    } else {
                        self.searchDetailView.titleTableView.isHidden = true
                        self.searchDetailView.emptyLabel.isHidden = false
                        self.searchDetailView.titleTableView.reloadData()
                    }
                    
                    print("Successfully mapped response: \(String(describing: self.searchResults))")
                } catch {
                    print("Mapping error: \(error.localizedDescription)")
                }
                
            case .failure(let error):
                print("Network request error: \(error.localizedDescription)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchResults?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = searchDetailView.titleTableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: self.searchResults![indexPath.row])
        
        return cell
    }
}

extension SearchDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 입력 값이 없을 경우
        guard let search = textField.text, !search.isEmpty else {
            print("none")
            return false
        }
        
        self.getSearchInfo(query: search)
        return true
    }
}
