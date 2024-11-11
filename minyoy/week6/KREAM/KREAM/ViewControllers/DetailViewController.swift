//
//  DetailViewController.swift
//  KREAM
//
//  Created by 주민영 on 11/9/24.
//

import UIKit

class DetailViewController: UIViewController {
    public var receivedData: ProductCardModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailView
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = true
        
        setupDelegate()
        
        if let data = receivedData {
            detailView.image.image = data.productImage
            detailView.nameEn.text = data.productTitle
            detailView.price.text = data.productPrice
        }
    }
    
    private lazy var detailView: DetailView = {
        let view = DetailView()
        
        let leftArrowButton = UIBarButtonItem(image: UIImage(named: "icon_leftArrow"), style: .plain, target: self, action: #selector(goBack))
        leftArrowButton.tintColor = UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)
        self.navigationItem.leftBarButtonItem = leftArrowButton
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goModal))
        view.buyBtn.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    private func setupDelegate() {
        detailView.imageCollectionView.delegate = self
        detailView.imageCollectionView.dataSource = self
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func goModal() {
        let buyvc = BuyViewController()
        
        buyvc.receivedData = detailView.image.image
        buyvc.modalPresentationStyle = .pageSheet
        present(buyvc, animated: true)
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DetailModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DetailCollectionViewCell.identifier,
            for: indexPath
        ) as? DetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = DetailModel.dummy()
        
        if let originalImage = UIImage(named: "item"),
           let multipliedImage = originalImage.overlay(with: list[indexPath.row].color) {
            cell.image.image = multipliedImage
        }
        return cell
    }
}
