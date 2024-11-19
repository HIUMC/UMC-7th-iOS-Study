//
//  File 2.swift
//  Kream
//
//  Created by KoNangYeon on 11/10/24.
//

import UIKit

class purchaseViewController: UIViewController {
    
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = purchaseView1
        
        setupDelegate()
    }
    
    private func setupDelegate() {
        purchaseView1.purchaseCollectionView.dataSource = self
        purchaseView1.purchaseCollectionView.delegate = self
    }
    
    private lazy var purchaseView1 = purchaseView().then {
        $0.backBtn.addTarget(self, action: #selector(backBtnDidTap), for: .touchUpInside)
    }
    
    @objc
    private func backBtnDidTap() {
        self.presentingViewController?.dismiss(animated: true)
    }
}

extension purchaseViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return purchaseModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: purchaseViewCell.identifier,
            for: indexPath //행 식별위해 파라미터로 받음
        ) as? purchaseViewCell else {
                return UICollectionViewCell()
        }
        
        let list = purchaseModel.dummy()
                
        cell.text1.text = list[indexPath.row].size
        cell.text2.text = list[indexPath.row].price
        
        return cell
    }
}

extension purchaseViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let previousIndexPath = selectedIndexPath,
           let previousCell = purchaseView1.purchaseCollectionView.cellForItem(at: previousIndexPath) as? purchaseViewCell {
            previousCell.backView.layer.borderColor = UIColor(hexCode: "F2F2F2").cgColor
            previousCell.text1.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            previousCell.text2.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        }
        if let cell = purchaseView1.purchaseCollectionView.cellForItem(at: indexPath) as? purchaseViewCell {
            cell.backView.layer.borderColor = UIColor.black.cgColor
            cell.text1.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            cell.text2.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        }
        
        selectedIndexPath = indexPath
    }
}
