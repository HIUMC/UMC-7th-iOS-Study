//
//  SearchViewController.swift
//  KREAM
//
//  Created by 주민영 on 10/29/24.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view = searchView
        setupDelegate()
    }
    
    private lazy var searchView: SearchView = {
        let view = SearchView()
        view.searchBar.addTarget(self, action: #selector(goSearchDetail), for: .touchDown)
        view.cancelButton.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        return view
    }()
    
    @objc private func goSearchDetail() {
        let searchDetailManagerVC = SearchDetailViewController()
        searchDetailManagerVC.modalPresentationStyle = .fullScreen
        present(searchDetailManagerVC, animated: false)
    }
    
    @objc private func goHome() {
        self.dismiss(animated: false)
    }
    
    private func setupDelegate() {
        searchView.searchRecCollectionView.dataSource = self
        searchView.searchRecCollectionView.delegate = self
    }
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SearchRecModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SearchRecCollectionViewCell.identifier,
            for: indexPath
        ) as? SearchRecCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = SearchRecModel.dummy()
        
        cell.recLabel.text = list[indexPath.row].text
        
        return cell
    }
}
