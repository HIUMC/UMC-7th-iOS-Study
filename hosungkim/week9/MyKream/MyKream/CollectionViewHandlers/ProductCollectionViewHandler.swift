//
//  ProductCollectionViewHandler.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.03.
//

import Foundation
import UIKit
import Kingfisher

class ProductCollectionViewHandler: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    var present: ((ProductModel)->Void)?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProductModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = ProductModel.dummy()
        
        
        cell.ivProduct.kf.setImage(with: list[indexPath.row].image)
        cell.lbTrading.text = list[indexPath.row].trading
        cell.lbTitle.text = list[indexPath.row].title
        cell.lbSubtitle.text = list[indexPath.row].subtitle
        cell.lbPrice.text = list[indexPath.row].price
        if list[indexPath.row].bookmark {
            cell.btnBookmark.setImage(UIImage(resource: .iconSavedFill), for: .normal)
        } else {
            cell.btnBookmark.setImage(UIImage(resource: .iconSaved), for: .normal)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        present?(ProductModel.dummy()[indexPath.row])
    }
}
