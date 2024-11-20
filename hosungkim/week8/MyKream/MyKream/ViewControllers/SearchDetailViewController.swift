//
//  SearchDetailViewController.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.20.
//

import UIKit
import Combine

class SearchDetailViewController: UIViewController {
    
    private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    var parentNavigationController: UINavigationController?
    
    private var searchResults: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = searchDetailView
    }
    
    private lazy var searchDetailView: SearchDetailView = {
        let view = SearchDetailView()
        view.tfSearch.addTarget(self, action: #selector(onValueChanged(sender:)), for: .editingChanged)
        view.btnBack.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        view.btnCancel.addTarget(self, action: #selector(onClickCancel), for: .touchUpInside)
        view.tableView.dataSource = self
        return view
    }()
    @objc private func onClickBack() {
        self.dismiss(animated: false)
    }
    @objc private func onClickCancel() {
        self.dismiss(animated: false) { [weak self] in
            self?.parentNavigationController?.popToRootViewController(animated: false)
        }
    }
    @objc private func onValueChanged(sender: UITextField) {
        print(sender.text)
        searchResults = []
        let text = sender.text ?? ""
        if text == "" {
            searchDetailView.tableView.reloadData()
            return
        }
        CommonRequest.shared.getProduct(search: text)
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { [weak self] searchEntities in
                self?.searchResults = searchEntities.products?.compactMap({ $0.title })
                self?.searchDetailView.tableView.reloadData()
            })
            .store(in: &cancellable)
    }
}

extension SearchDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        
        cell.lbTitle.text = searchResults?[indexPath.row]
        
        return cell
    }
}
