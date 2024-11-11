//
//  ProductViewController.swift
//  cloneKream
//
//  Created by 김서현 on 11/10/24.
//

import UIKit

class ProductViewController: UIViewController {
    
    private let rootView = ProductView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view = rootView
        rootView.otherColorCollectionView.dataSource = self
        
        
        let backButton = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem  = backButton
        
        rootView.buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
        
        
    }
    
    @objc private func backButtonTapped() {
        print("back")
    }
    
    @objc func buyButtonTapped() {
        let viewController = BuyViewController()
        
        viewController.modalPresentationStyle = .pageSheet
        
        self.present(viewController, animated: true)
    }
    

}


extension ProductViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        OtherColorModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OtherColorCollectionViewCell.identifier, for: indexPath) as? OtherColorCollectionViewCell else { return UICollectionViewCell() }
        let list = OtherColorModel.dummy()
        cell.imageView.image = list[indexPath.row].image
        return cell
    }
    
    
}
