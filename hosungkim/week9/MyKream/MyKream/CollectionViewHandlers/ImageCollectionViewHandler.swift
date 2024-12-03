//
//  ImageCollectionViewHandler.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.10.
//

import Foundation
import UIKit

class ImageCollectionViewHandler: NSObject, UICollectionViewDataSource {
    private static let images: [UIImage] = [
        UIImage(named: "m0.png")!,
        UIImage(named: "m1.png")!,
        UIImage(named: "m2.png")!,
        UIImage(named: "m3.png")!,
        UIImage(named: "m4.png")!,
        UIImage(named: "m5.png")!,
        
    ]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageCollectionViewHandler.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.ivImage.image = ImageCollectionViewHandler.images[indexPath.row]
        return cell
    }
}
