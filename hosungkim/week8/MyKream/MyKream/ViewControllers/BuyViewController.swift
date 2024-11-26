//
//  BuyViewController.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.10.
//

import UIKit

class BuyViewController: UIViewController {
    
    var productModel: ProductModel?
    private let sizeCollectionViewHandler: SizeCollectionViewHandler = SizeCollectionViewHandler()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = buyView
    }
    
    private lazy var buyView: BuyView = {
        let view = BuyView()
        view.btnClose.addTarget(self, action: #selector(onClickClose), for: .touchUpInside)
        view.applyProductModel(productModel: productModel)
        view.cvSize.dataSource = sizeCollectionViewHandler
        view.cvSize.delegate = sizeCollectionViewHandler
        return view
    }()
    
    @objc private func onClickClose() {
        dismiss(animated: true)
    }
}
