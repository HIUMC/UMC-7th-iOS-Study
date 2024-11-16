//
//  ProductDetailViewController.swift
//  KreamClone
//
//  Created by 이현주 on 11/10/24.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    private var productList: [String] = ["red", "orange", "yellow", "green", "blue", "purple", "red", "orange", "yellow", "green", "blue", "purple"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = productDetailView
        
        let backbutton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .done, target: self, action: #selector(goToBack))
        self.navigationItem.leftBarButtonItem = backbutton
        self.navigationController?.navigationBar.tintColor = UIColor(hex: "#848484")
    }
    
    private lazy var productDetailView: ProductDetailView = {
        let v = ProductDetailView()
        v.productCollectionView.delegate = self
        v.productCollectionView.dataSource = self
        
        v.buyBtn.addTarget(self, action: #selector(goToBuy), for: .touchUpInside)
        v.savedBtn.addTarget(self, action: #selector(savedBtnTapped), for: .touchUpInside)
        return v
    }()
    
    @objc private func savedBtnTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
            
        // 버튼이 클릭될 때마다, 버튼 이미지를 변환
        if sender.isSelected {
            sender.setImage(UIImage(named: "savedIcon")?.withRenderingMode(.alwaysOriginal), for: .selected)
            productDetailView.savedCount.text = "2,123"
        } else {
            sender.setImage(UIImage(named: "nSavedIcon")?.withRenderingMode(.alwaysOriginal), for: .normal)
            productDetailView.savedCount.text = "2,122"
        }
    }
    
    @objc
    private func goToBuy() {
        let vc = ProductBuyViewController()
        vc.productBuyView.productImg.image = productDetailView.nowImage.image
        vc.modalPresentationStyle = .automatic
        present(vc, animated: true)
    }
    
    @objc
    private func goToBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProductDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        
        cell.configure(image: productList[indexPath.item])
        
        return cell
    }
}

