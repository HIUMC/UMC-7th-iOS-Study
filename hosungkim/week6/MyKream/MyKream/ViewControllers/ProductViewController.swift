//
//  ProduvtViewController.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.08.
//

import UIKit

class ProductViewController: UIViewController {
    
    var productModel: ProductModel?
    private let imageCollectionViewHandler: ImageCollectionViewHandler = ImageCollectionViewHandler()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = productView
        tabBarController?.isTabBarHidden = true
    }
    
    private lazy var productView: ProductView = {
        let view = ProductView()
        view.applyProductModel(productModel: productModel)
        view.cvImage.dataSource = imageCollectionViewHandler
        view.btnBack.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        view.btnBuy.addTarget(self, action: #selector(onClickBuy), for: .touchUpInside)
        view.btnBookmark.addTarget(self, action: #selector(onClickBookmark(sender:)), for: .touchUpInside)
        return view
    }()
    
    @objc private func onClickBack() {
        navigationController?.popViewController(animated: true)
    }
    @objc private func onClickBuy() {
        let viewController = BuyViewController()
        viewController.productModel = productModel
        viewController.modalPresentationStyle = .pageSheet
        present(viewController, animated: true)
    }
    @objc private func onClickBookmark(sender: UIButton) {
        sender.isSelected.toggle()
        
        if sender.isSelected {
            sender.setImage(UIImage(resource: .iconSavedFill), for: .normal)
        } else {
            sender.setImage(UIImage(resource: .iconSaved), for: .normal)
        }
    }
}
