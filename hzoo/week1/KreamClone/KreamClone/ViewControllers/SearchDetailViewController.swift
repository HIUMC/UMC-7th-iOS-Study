//
//  SearchDetailViewController.swift
//  KreamClone
//
//  Created by 이현주 on 11/25/24.
//

import UIKit
import Moya

class SearchDetailViewController: UIViewController, UITextFieldDelegate {
    
    private let provider = MoyaProvider<SearchTargetType>()
    private var result: [Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchDeatilView
    }
    
    public lazy var searchDeatilView: SearchDetailView = {
        let v = SearchDetailView()
        v.backBtn.addTarget(self, action: #selector(cancelBtnTapped), for: .touchUpInside)
        v.cancelBtn.addTarget(self, action: #selector(cancelBtnTapped), for: .touchUpInside)
        
        v.searchResultTableView.dataSource = self
        v.searchResultTableView.delegate = self
        v.searchBar.delegate = self
        
        return v
    }()
    
    // 엔터키가 눌러졌을 때 호출
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let query = searchDeatilView.searchBar.text, !query.isEmpty {
            getSearchResult(q: query)
        }
        return true
    }

    
    @objc
    private func cancelBtnTapped() {
        self.dismiss(animated: true)
    }
    
    private func getSearchResult(q: String) {
        provider.request(.getResultName(q: q)) { result in
            switch result {
            case .success(let response):
                do {
                    let resultResponse = try response.map(SearchResponse.self)
                    self.result = resultResponse.products
                    self.searchDeatilView.searchResultTableView.reloadData()
                    print("Successfully mapped response: \(resultResponse)")
                } catch {
                    print("Mapping error: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Mapping error: \(error.localizedDescription)")
            }
        }
    }
}

extension SearchDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: indexPath) as? SearchResultTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(model: result[indexPath.row].title)
        
        return cell
    }
}
