//
//  DetailViewController.swift
//  KREAM
//
//  Created by 이태림 on 11/11/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    public var receivedreleasedData: ReleasedModel?
    
    private lazy var detailview = DetailView().then {
        $0.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailview

        
        let backButton = UIBarButtonItem(image: UIImage(named: "leftback"), style: .plain, target: self, action: #selector(back))
        backButton.tintColor = UIColor(red: 0.52, green: 0.52, blue: 0.52, alpha: 1.00)
        self.navigationItem.leftBarButtonItem = backButton
        
        if let data = receivedreleasedData {
            detailview.productimage.image = UIImage(named: data.image)
            detailview.nowbuyLabel.text = data.rightbuyname
            detailview.detailpriceLabel.text = data.pricename
            detailview.detailproductLabel.text = data.productname
        }
        
        detailDelegate()
        
        detailview.buybutton.addTarget(self, action: #selector(didTappedbuybutton), for: .touchUpInside)
    }
    
    private func detailDelegate() {
        detailview.DetailCollectionView.dataSource = self
    }
    
    @objc
    private func back() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func didTappedbuybutton() {
        let viewcontroller = PurchaseViewController()
        
       
        viewcontroller.modalPresentationStyle = .automatic
        
        viewcontroller.receivedimage = detailview.productimage.image
        present(viewcontroller, animated: true)
    }

}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DetailModel.detaildummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath) as? DetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = DetailModel.detaildummy()
        
        cell.detailconfigure(model: list[indexPath.row])
        
        return cell
    }
    
    
}
