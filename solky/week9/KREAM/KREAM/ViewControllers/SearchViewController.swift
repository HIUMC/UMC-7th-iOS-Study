//
//  SearchViewController.swift
//  KREAM
//
//  Created by 이태림 on 10/31/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    private lazy var searchview = SearchView().then {
        $0.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchview
        recommendDelegate()
        searchview.cancelButton.addTarget(self, action: #selector(clickcancelbutton), for: .touchUpInside)
        searchview.searchButton.addTarget(self, action: #selector(clicksearchbutton), for: .touchUpInside)
    }
    
    private func recommendDelegate() {
        searchview.recommendCollectionView.dataSource = self
        searchview.recommendCollectionView.delegate = self
    }
    
    @objc private func clickcancelbutton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func clicksearchbutton() {
        let viewcontroller = SearchDetailViewController()
        
        viewcontroller.hidesBottomBarWhenPushed = false
        viewcontroller.modalPresentationStyle = .fullScreen

        present(viewcontroller, animated: true)
    }
}


extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RecommendModel.recommenddummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as? RecommendCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let model = RecommendModel.recommenddummy()[indexPath.row]
            
        cell.titleLabel.text = model.name
        
        return cell
    }
    
    
}
