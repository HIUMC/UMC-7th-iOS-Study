//
//  BuyViewController.swift
//  KREAM
//
//  Created by 주민영 on 11/9/24.
//

import UIKit

class BuyViewController: UIViewController {
    public var receivedData: UIImage?
    let sizeList = ["S", "M", "L", "XL", "XXL"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = buyView
        setupDelegate()
        if let data = receivedData {
            buyView.image.image = data
        }
    }
    
    private lazy var buyView: BuyView = {
        let view = BuyView()
        view.cancelButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return view
    }()
    
    @objc private func goBack() {
        dismiss(animated: true)
    }
    
    private func setupDelegate() {
        buyView.sizeCollectionView.delegate = self
        buyView.sizeCollectionView.dataSource = self
    }
}

extension BuyViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sizeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SizeCollectionViewCell.identifier,
            for: indexPath
        ) as? SizeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.sizeBtn.configuration?.attributedTitle = AttributedString(sizeList[indexPath.row], attributes: AttributeContainer([
            .font: UIFont.systemFont(ofSize: 14, weight: .regular),
            .foregroundColor: UIColor.black,
        ]))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SizeCollectionViewCell {
            cell.sizeBtn.configuration?.attributedTitle = AttributedString(sizeList[indexPath.row], attributes: AttributeContainer([
                .font: UIFont.systemFont(ofSize: 14, weight: .semibold),
                .foregroundColor: UIColor.black,
            ]))
            cell.isSelected = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SizeCollectionViewCell {
            cell.sizeBtn.configuration?.attributedTitle = AttributedString(sizeList[indexPath.row], attributes: AttributeContainer([
                .font: UIFont.systemFont(ofSize: 14, weight: .regular),
                .foregroundColor: UIColor.black,
            ]))
            cell.isSelected = false
        }
    }
}
