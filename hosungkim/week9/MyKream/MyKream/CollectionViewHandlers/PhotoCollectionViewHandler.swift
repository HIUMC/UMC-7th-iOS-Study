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
        PhotoModel(image: URL(string: "https://lv2-cdn.azureedge.net/jypark/f8ba911ed379439fbe831212be8701f9-231103%206PM%20%EB%B0%95%EC%A7%84%EC%98%81%20Conceptphoto03(Clean).jpg")!, title: "@katarinabluu"),
        PhotoModel(image: URL(string: "https://lv2-cdn.azureedge.net/jypark/4bdca5fcc29c48c08071eaaa5cd43e79-231103%206PM%20%EB%B0%95%EC%A7%84%EC%98%81%20%ED%94%84%EB%A1%9C%ED%95%84%20%EC%82%AC%EC%A7%84.jpg")!, title: "@imwinter"),
        PhotoModel(image: URL(string: "https://lv2-cdn.azureedge.net/jypark/0.jpg")!, title: "@thousand_wooo"),
        PhotoModel(image: URL(string: "https://lv2-cdn.azureedge.net/jypark/gallery_150125165011.jpg")!, title: "@thousand_wooo"),
        PhotoModel(image: URL(string: "https://lv2-cdn.azureedge.net/jypark/c726ced3865543a296dde99424fda29c-Still%20Alive.jpg")!, title: "@thousand_wooo"),
        PhotoModel(image: URL(string: "https://lv2-cdn.azureedge.net/jypark/9b145cd47f4f40df8c62ab3af0b60fcb-JYP-Groove%20Missing-OnlineCover.png")!, title: "@thousand_wooo"),
        PhotoModel(image: URL(string: "https://lv2-cdn.azureedge.net/jypark/9e9bc12fbb24494d98695ac1fa8be153-JYP_Groove%20Missing_%ED%8B%B0%EC%A0%80%ED%81%B4%EB%A6%B0%EB%B3%B8_02.jpg")!, title: "@thousand_wooo"),
        PhotoModel(image: URL(string: "https://lv2-cdn.azureedge.net/jypark/9726350cf1224be19c2d8c7d64710d32-JYP_Groove%20Missing_%ED%8B%B0%EC%A0%80%ED%81%B4%EB%A6%B0%EB%B3%B8_01.jpg")!, title: "@thousand_wooo"),
        PhotoModel(image: URL(string: "https://lv2-cdn.azureedge.net/jypark/465dbe7e36a34e6a82803b2c9207818e-3.jpg")!, title: "@thousand_wooo"),
        PhotoModel(image: URL(string: "https://lv2-cdn.azureedge.net/jypark/34da8b05640c417a9107c59235118a2d-%E1%84%8F%E1%85%B3%E1%86%AF%E1%84%85%E1%85%B5%E1%86%AB1-3.jpg")!, title: "@thousand_wooo"),
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoCollectionViewHandler.dummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.ivPhoto.kf.setImage(with: PhotoCollectionViewHandler.dummy[indexPath.row].image)
        cell.lbTitle.text = PhotoCollectionViewHandler.dummy[indexPath.row].title
        return cell
    }
}
