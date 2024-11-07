//
//  HomeViewController.swift
//  KREAM
//
//  Created by 주민영 on 10/8/24.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        setupAction()
        setupDelegate()
    }
    
    private func setupAction() {
        homeView.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(segment:)), for: .valueChanged)
    }
    
    private func setupDelegate() {
        homeView.menuCollectionView.dataSource = self
    }
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.searchBar.addTarget(self, action: #selector(btnDidTap), for: .touchDown)
        return view
    }()
    
    @objc
    private func btnDidTap() {
        let searchManagerVC = SearchViewController()
        navigationController?.pushViewController(searchManagerVC, animated: false)
    }
    
    @objc private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.adImageView.isHidden = false
            homeView.menuCollectionView.isHidden = false
        }
        else {
            homeView.adImageView.isHidden = true
            homeView.menuCollectionView.isHidden = true
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

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MenuModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MenuCollectionViewCell.identifier,
            for: indexPath
        ) as? MenuCollectionViewCell else {
            return UICollectionViewCell()
        }

        let list = MenuModel.dummy()
                
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].title
        cell.imageView.backgroundColor = list[indexPath.row].color
        
        return cell
    }
}
