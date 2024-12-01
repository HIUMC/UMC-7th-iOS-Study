//
//  SearchDetailViewController.swift
//  KREAM
//
//  Created by 이태림 on 11/25/24.
//

import UIKit
import Moya

class SearchDetailViewController: UIViewController {
    
    private let provider = MoyaProvider<SearchTargetType>()
    var searchResults: [SearchResponse]?
    
    private lazy var searchdetailview = SearchDetailView().then {
        $0.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchdetailview
        searchdetailview.backButton.addTarget(self, action: #selector(clickbackbutton), for: .touchUpInside)
        searchdetailview.cancelButton.addTarget(self, action: #selector(clickcancelbutton), for: .touchUpInside)
        searchdetailview.searchtextfield.addTarget(self, action: #selector(performSearch), for: .editingDidEndOnExit)
        setupDelegate()
    }
    
    private func setupDelegate() {
        searchdetailview.searchtableView.delegate = self
        searchdetailview.searchtableView.dataSource = self
    }
    
    @objc private func performSearch() {
        guard let keyword = searchdetailview.searchtextfield.text, !keyword.isEmpty else {
            print("검색어가 비어 있습니다.")
            return
        }

        provider.request(.getAllProducts(keyword: keyword)) { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    let searchResponse = try response.map(SearchResponseModel.self).products
                    self?.searchResults = searchResponse
                 
                    if let searchResults = self?.searchResults, !searchResults.isEmpty {
                        self?.searchdetailview.searchtableView.isHidden = false
                        self?.searchdetailview.searchtableView.reloadData()
                    } else {
                        self?.searchdetailview.searchtableView.isHidden = true
                        self?.searchdetailview.searchtableView.reloadData()
                    }
                    
                    print("Successfully mapped response: \(String(describing: self?.searchResults))")
                } catch {
                    print("Mapping error: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Network request error: \(error.localizedDescription)")
            }
        }
    }

    
    @objc func clickbackbutton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func clickcancelbutton() {
        self.view.window?.rootViewController = MainViewController()
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }

}
 
extension SearchDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchResults?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = searchdetailview.searchtableView.dequeueReusableCell(
            withIdentifier: SearchTableViewCell.identifier,
            for: indexPath
        ) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: self.searchResults![indexPath.row])
        
        return cell
    } 
}

