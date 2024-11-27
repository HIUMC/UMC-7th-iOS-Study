//
//  HomeViewController.swift
//  KREAM
//
//  Created by 주민영 on 10/8/24.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
        setupAction()
        setupDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.view = homeView
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
        setupAction()
        setupDelegate()
    }
    
    private func setupAction() {
        homeView.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(segment:)), for: .valueChanged)
    }
    
    private func setupDelegate() {
        homeView.menuCollectionView.delegate = self
        homeView.menuCollectionView.dataSource = self
        
        homeView.productCollectionView.delegate = self
        homeView.productCollectionView.dataSource = self
        
        homeView.imageCollectionView.delegate = self
        homeView.imageCollectionView.dataSource = self
    }
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.searchBar.addTarget(self, action: #selector(pushSearchView), for: .touchDown)
        return view
    }()
    
    @objc private func pushSearchView() {
        let searchManagerVC = SearchViewController()
        searchManagerVC.modalPresentationStyle = .fullScreen
        present(searchManagerVC, animated: false)
    }
    
    @objc private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.homeScrollView.isHidden = false
        }
        else {
            homeView.homeScrollView.isHidden = true
        }
        
        let underlineFinalXPosition = (self.homeView.segmentedControl.bounds.width / CGFloat(homeView.segmentedControl.numberOfSegments)) * CGFloat(homeView.segmentedControl.selectedSegmentIndex) + 16
        UIView.animate(
          withDuration: 0.2,
          animations: {
              self.homeView.underLineView.frame.origin.x = underlineFinalXPosition
              self.homeView.layoutIfNeeded()
          }
        )
    }
}

extension HomeViewController: UICollectionViewDelegate ,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            let detailVC = DetailViewController()
            detailVC.receivedData = ProductCardModel.dummy()[indexPath.row]
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return MenuModel.dummy().count
        } else if collectionView.tag == 1 {
            return ProductCardModel.dummy().count
        } else if collectionView.tag == 2 {
            return ImageCardModel.dummy().count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MenuCollectionViewCell.identifier,
                for: indexPath
            ) as! MenuCollectionViewCell
            let list = MenuModel.dummy()
            
            cell.imageView.image = list[indexPath.row].image
            cell.titleLabel.text = list[indexPath.row].title
            cell.imageView.backgroundColor = list[indexPath.row].color
            
            return cell
        } else if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductCollectionViewCell.identifier,
                for: indexPath
            ) as! ProductCollectionViewCell
            let list = ProductCardModel.dummy()
            
            cell.image.kf.setImage(with: URL(string: list[indexPath.row].productImageURL))
            cell.transaction.text = "거래 \(list[indexPath.row].transaction)만"
            cell.brand.text = list[indexPath.row].brand
            cell.product.text = list[indexPath.row].nameEn
            cell.price.text = list[indexPath.row].productPrice + "원"
            cell.image.backgroundColor = list[indexPath.row].color
            
            return cell
        } else if collectionView.tag == 2 {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ImageCollectionViewCell.identifier,
                for: indexPath
            ) as! ImageCollectionViewCell
            let list = ImageCardModel.dummy()
            
            cell.image.kf.setImage(with: URL(string: list[indexPath.row].imageURL))
            cell.usernameLabel.text = "@" + list[indexPath.row].username
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}
