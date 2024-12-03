//
//  HomeViewController.swift
//  MyKream
//
//  Created by 김호성 on 2024.10.04.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let menuCollectionViewHandler: CircleCollectionViewHandler = CircleCollectionViewHandler()
    private let productCollectionViewHandler: ProductCollectionViewHandler = ProductCollectionViewHandler()
    private let photoCollectionViewHandler: PhotoCollectionViewHandler = PhotoCollectionViewHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        self.view = homeView
        productCollectionViewHandler.present = { [weak self] productModel in
            self?.presentProductViewController(productModel: productModel)
        }
        print("HomeViewController")
    }
    override func viewDidAppear(_ animated: Bool) {
        homeView.updateSelectedSegmentView(index: 0)
    }
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.segmentControl.addTarget(self, action: #selector(segmentControlValueChanged(segment:)), for: .valueChanged)
        view.recommendView.cvCircle.dataSource = menuCollectionViewHandler
        view.recommendView.cvProduct.dataSource = productCollectionViewHandler
        view.recommendView.cvProduct.delegate = productCollectionViewHandler
        view.recommendView.cvPhoto.dataSource = photoCollectionViewHandler
        view.tfSearch.delegate = self
        view.scrollView.delegate = self
        return view
    }()
    
    @objc private func segmentControlValueChanged(segment: UISegmentedControl) {
        UIView.animate(withDuration: 0.1, animations: {
            self.homeView.updateContainerView(index: segment.selectedSegmentIndex)
            self.homeView.updateSelectedSegmentView(index: segment.selectedSegmentIndex)
            self.homeView.layoutIfNeeded()
        })
    }
    private func presentProductViewController(productModel: ProductModel) {
        let viewController = ProductViewController()
        viewController.productModel = productModel
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let viewController = SearchViewController()
        
        navigationController?.pushViewController(viewController, animated: false)
        textField.endEditing(false)
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("zoom")
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scroll")
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return homeView.contentView
    }
}
