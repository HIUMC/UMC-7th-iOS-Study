//
//  PurchaseViewController.swift
//  KREAM
//
//  Created by 이태림 on 11/11/24.
//

import UIKit

class PurchaseViewController: UIViewController {
    
    public var receivedimage: UIImage?
    private lazy var purchaseview = PurchaseView().then {
        $0.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = purchaseview
        
        purchaseview.closebutton.addTarget(self, action: #selector(DidTappedclosebutton), for: .touchUpInside)
        
        sizeDelegate()
        
        if let data = receivedimage {
            purchaseview.sizeimage.image = data
        }
    }
    
    private func sizeDelegate() {
        purchaseview.SizeCollectionView.dataSource = self
        purchaseview.SizeCollectionView.delegate = self
    }
    
    @objc private func DidTappedclosebutton() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension PurchaseViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return SizeModel.sizedummy().count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SizeCollectionViewCell.identifier, for: indexPath) as? SizeCollectionViewCell else {
            return UICollectionViewCell()
        }
        let list = SizeModel.sizedummy()
        
        cell.sizeconfigure(model: list[indexPath.row])
        
        return cell
    }
    
    
}

