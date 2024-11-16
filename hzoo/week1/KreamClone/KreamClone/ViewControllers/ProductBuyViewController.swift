//
//  ProductBuyViewController.swift
//  KreamClone
//
//  Created by 이현주 on 11/10/24.
//

import UIKit

class ProductBuyViewController: UIViewController {
    
    private var sizeList: [String : String] = ["S" : "360,000", "M" : "360,000", "L" : "360,000", "XL" : "360,000", "XXL" : "360,000"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = productBuyView
        
        productBuyView.sizeCollectionView.allowsMultipleSelection = false
    }
    
    public lazy var productBuyView: ProductBuyView = {
        let p = ProductBuyView()
        p.sizeCollectionView.delegate = self
        p.sizeCollectionView.dataSource = self
    
        p.cancelBtn.addTarget(self, action: #selector(goToBack), for: .touchUpInside)
        return p
    }()
    
    @objc
    private func goToBack() {
        dismiss(animated: true, completion: nil)
    }
}

extension ProductBuyViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sizeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SizeCollectionViewCell.identifier, for: indexPath) as! SizeCollectionViewCell
        
        cell.configure(size: Array(sizeList.keys)[indexPath.item], price: Array(sizeList.values)[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SizeCollectionViewCell else { return }
       
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.black.cgColor
        cell.size.font = .systemFont(ofSize: 14, weight: .semibold)
        cell.price.font = .systemFont(ofSize: 12, weight: .semibold)
        
        // 다른 셀의 스타일 초기화
        collectionView.visibleCells.forEach { visibleCell in
            if let otherCell = visibleCell as? SizeCollectionViewCell, otherCell != cell {
                otherCell.layer.borderColor = UIColor(hex: "#F2F2F2")?.cgColor
                otherCell.size.font = .systemFont(ofSize: 14, weight: .regular)
                otherCell.price.font = .systemFont(ofSize: 12, weight: .regular)
            }
        }
    }
}
