//
//  SearchViewController.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.01.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let recommendDatas: [String] = [
        "채원 슈프림 후리스",
        "나이키V2K런",
        "뉴발란드996",
        "신상 나이키 콜라보",
        "허그 FW 패딩",
        "벨루어 눕시",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchView
    }
    private lazy var searchView: SearchView = {
        let view = SearchView()
        view.tfSearch.delegate = self
        view.btnCancel.addTarget(self, action: #selector(onClickCancel), for: .touchUpInside)
        view.cvRecommend.dataSource = self
        return view
    }()
    
    @objc private func onClickCancel() {
        navigationController?.popViewController(animated: false)
    }
}


extension SearchViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let viewController = SearchDetailViewController()
        viewController.parentNavigationController = self.navigationController
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: false)
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as? RecommendCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.lbMain.text = recommendDatas[indexPath.row]
        return cell
    }
}
