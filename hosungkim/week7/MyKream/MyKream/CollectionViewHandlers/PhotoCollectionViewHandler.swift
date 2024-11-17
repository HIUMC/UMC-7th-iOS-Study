//
//  PhotoCollectionViewHandler.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.03.
//

import Foundation
import UIKit

class PhotoCollectionViewHandler: NSObject, UICollectionViewDataSource {
    private static var dummy: [PhotoModel] = [
            PhotoModel(image: UIImage(named: "photo0.png")!, title: "@katarinabluu"),
            PhotoModel(image: UIImage(named: "photo1.png")!, title: "@imwinter"),
            PhotoModel(image: UIImage(named: "photo2.png")!, title: "@thousand_wooo"),
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoCollectionViewHandler.dummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.ivPhoto.image = PhotoCollectionViewHandler.dummy[indexPath.row].image
        cell.lbTitle.text = PhotoCollectionViewHandler.dummy[indexPath.row].title
        return cell
    }
}
