//
//  searchViewController.swift
//  Kream
//
//  Created by KoNangYeon on 11/3/24.
//

import UIKit
import Then

class searchViewController: UIViewController, UICollectionViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchView1
        
        navigationController?.isNavigationBarHidden = true
        
        setupDelegate()
    }
    
    private lazy var searchView1 = searchView().then {
        $0.btn.addTarget(self, action: #selector(backbtnDidTap), for: .touchUpInside)
        $0.searchBar.addTarget(self, action: #selector(searchBarDidTap), for: .editingDidBegin)
    }
    

    @objc
    private func backbtnDidTap() {
        self.presentingViewController?.dismiss(animated: false)
    }
    
    @objc
    private func searchBarDidTap() {
        let detailedSearchVC = detailedSearchViewController()
        navigationController?.pushViewController(detailedSearchVC, animated: true)
    }
    
    private func setupDelegate() {
        searchView1.searchCollectionView.dataSource = self
        
        searchView1.searchCollectionView.delegate = self
    }
}

extension searchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: searchViewCell.identifier,
            for: indexPath //행 식별위해 파라미터로 받음
        ) as? searchViewCell else {
                return UICollectionViewCell()
        }
        
        let list = searchModel.dummy()
                
        cell.title.text = list[indexPath.row].product
        
        return cell
    }
}
