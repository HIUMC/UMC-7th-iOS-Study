//
//  BuyViewController.swift
//  cloneKream
//
//  Created by 김서현 on 11/11/24.
//

import UIKit

class BuyViewController: UIViewController {
    
    private let rootView = BuyView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = rootView
        
        rootView.sizeCollectionView.dataSource = self
        rootView.sizeCollectionView.delegate = self
        
        rootView.dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        
        
    }
    
    @objc func dismissButtonTapped() {
        self.dismiss(animated: true)
    }
    
}

extension BuyViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        SizeModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductSizeCollectionViewCell.identifier, for: indexPath) as? ProductSizeCollectionViewCell else { return UICollectionViewCell() }
        let list = SizeModel.dummy()
        cell.sizeLabel.text = list[indexPath.row].size
        cell.priceLabel.text = "\(list[indexPath.row].price)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ProductSizeCollectionViewCell {
            cell.selected()
        }
    }


    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ProductSizeCollectionViewCell {
            cell.deselected()
        }
    }
    
    
}
