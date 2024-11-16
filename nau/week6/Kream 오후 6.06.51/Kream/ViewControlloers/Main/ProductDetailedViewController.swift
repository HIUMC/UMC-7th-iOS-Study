//
//  ProductDetailedViewController.swift
//  Kream
//
//  Created by KoNangYeon on 11/9/24.
//

import UIKit
import Then
import SnapKit

class ProductDetailedViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = productDetailedView
        
        self.navigationItem.hidesBackButton = true
        
        setupDelegate()
    }
    
    private func setupDelegate() {
        productDetailedView.collectionView.dataSource = self
    }
    
    private lazy var productDetailedView = ProductDetailedView().then {
        $0.backBtn.addTarget(self, action: #selector(backBtnDidTap), for: .touchUpInside)
        $0.purchaseBtn.addTarget(self, action: #selector(BtnDidTap), for: .touchUpInside)
        $0.savedBtn.addTarget(self, action: #selector(savedBtnDidTap), for: .touchUpInside)
    }
   
    @objc
    private func backBtnDidTap(){
        self.navigationController?.popViewController(animated: true)
    }
                                 
    @objc
    private func BtnDidTap(){
        let VC = purchaseViewController()
        VC.modalPresentationStyle = .pageSheet
        present(VC, animated: true)
    }
    
    @objc
    private func savedBtnDidTap(_ sender: UIButton){
        sender.isSelected.toggle()
        
        if sender.isSelected {
            sender.setImage(.saved, for: .selected)
            } else {
                sender.setImage(.notsaved, for: .normal)
        }
    }

}

extension ProductDetailedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProductDetailedModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailedViewCell.identifier,
            for: indexPath //행 식별위해 파라미터로 받음
        ) as? ProductDetailedViewCell else {
                return UICollectionViewCell()
        }
        
        let list = ProductDetailedModel.dummy()
                
        cell.imageView.image = list[indexPath.row].image
        
        return cell
    }
}

