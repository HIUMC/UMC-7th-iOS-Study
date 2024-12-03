//
//  SizeCollectionViewHandler.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.10.
//

import Foundation
import UIKit

class SizeCollectionViewHandler: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private static let sizes: [(String, String)] = [
        ("S", "360,000"),
        ("M", "360,000"),
        ("L", "360,000"),
        ("XL", "360,000"),
        ("XXL", "360,000"),
    ]
    
    private var selectedIndex: Int = SizeCollectionViewHandler.sizes.count/2
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SizeCollectionViewHandler.sizes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SizeCollectionViewCell.identifier, for: indexPath) as? SizeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.lbSize.text = SizeCollectionViewHandler.sizes[indexPath.row].0
        cell.lbPrice.text = SizeCollectionViewHandler.sizes[indexPath.row].1
        cell.applySelectedStyle(selected: indexPath.row == selectedIndex)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        collectionView.reloadData()
    }
}
