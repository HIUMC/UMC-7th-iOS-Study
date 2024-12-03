//
//  MenuCollectionViewHandler.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.03.
//

import Foundation
import UIKit

class CircleCollectionViewHandler: NSObject, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CircleModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCollectionViewCell.identifier, for: indexPath) as? CircleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = CircleModel.dummy()
        
        cell.ivImage.image = list[indexPath.row].image
        cell.lbTitle.text = list[indexPath.row].title
        
        return cell
    }
}
