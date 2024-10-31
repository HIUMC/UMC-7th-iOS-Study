//
//  HomeViewController.swift
//  KREAM
//
//  Created by 이태림 on 10/8/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var emptyview = UIView().then {
        $0.backgroundColor = .white
    }
    
    private lazy var homeview = HomeView().then {
        $0.backgroundColor = .white
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeview

        homeview.searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        homeview.segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)

        setupDelegate()
        
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            segmentChanged()
    }
    
    private func setupDelegate() {
        homeview.HomeCollectionView.dataSource = self
    }
    
    
    @objc
    func search() {
        let viewcontroller = SearchViewController()
        
       
        viewcontroller.modalPresentationStyle = .automatic
               
        present(viewcontroller, animated: true)
    }
    
    
    @objc private func segmentChanged() {
        let segmentedWidth = homeview.segmentedControl.bounds.width / CGFloat(homeview.segmentedControl.numberOfSegments)
        let xPosition = segmentedWidth * CGFloat(homeview.segmentedControl.selectedSegmentIndex)
        
        UIView.animate(withDuration: 0.1) {
            self.homeview.underlineView.frame = CGRect(
                x: xPosition,
                y: self.homeview.segmentedControl.frame.maxY,
                width: segmentedWidth,
                height: 2
            )
        }
        
        if homeview.segmentedControl.selectedSegmentIndex == 0 {
            homeview.HomeCollectionView.isHidden = false
            homeview.dontlateimage.isHidden = false
            emptyview.isHidden = true
        }
        else {
            homeview.HomeCollectionView.isHidden = true
            homeview.dontlateimage.isHidden = true
            emptyview.isHidden = false
        }
    }
}


extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = HomeModel.dummy()
        
        cell.imageview.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].name
        
        return cell
    }
    
    
}
