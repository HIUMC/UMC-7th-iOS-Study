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
        releasedsetupDelegate()
        MustItemsetupDelegate()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        segmentChanged()
    }
    
    private func setupDelegate() {
        homeview.HomeCollectionView.dataSource = self
        homeview.HomeCollectionView.tag = 1
    }
    
    private func releasedsetupDelegate() {
        homeview.ReleasedCollectionView.dataSource = self
        homeview.ReleasedCollectionView.tag = 2
    }
    
    private func MustItemsetupDelegate() {
        homeview.MustItemCollectionView.dataSource = self
        homeview.MustItemCollectionView.tag = 3
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
            homeview.MustItemCollectionView.isHidden = false
            homeview.ReleasedCollectionView.isHidden = false
            homeview.separateview1.isHidden = false
            homeview.separateview2.isHidden = false
            homeview.dropLabel.isHidden = false
            homeview.releasedLabel.isHidden = false
            homeview.mustitLabel.isHidden = false
            homeview.happyLabel.isHidden = false
            emptyview.isHidden = true
            
        }
        else {
            homeview.HomeCollectionView.isHidden = true
            homeview.dontlateimage.isHidden = true
            homeview.MustItemCollectionView.isHidden = true
            homeview.ReleasedCollectionView.isHidden = true
            homeview.separateview1.isHidden = true
            homeview.separateview2.isHidden = true
            homeview.dropLabel.isHidden = true
            homeview.releasedLabel.isHidden = true
            homeview.mustitLabel.isHidden = true
            homeview.happyLabel.isHidden = true
            emptyview.isHidden = false
        }
    }
}


extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return HomeModel.dummy().count
        }
        else if collectionView.tag == 2 {
            return ReleasedModel.dummy2().count // 새로운 모델 사용
        }
        else if collectionView.tag == 3 {
            return MustItemModel.dummy3().count
        }
        return 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            let list = HomeModel.dummy()
            
            cell.imageview.image = HomeModel.dummy()[indexPath.row].image
            cell.titleLabel.text = HomeModel.dummy()[indexPath.row].name
            
            return cell
        }
        else if collectionView.tag == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReleasedCollectionViewCell.identifier, for: indexPath) as? ReleasedCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let list = ReleasedModel.dummy2()
            
            cell.releasedconfigure(model: list[indexPath.row])
            
            return cell
        }
        else if collectionView.tag == 3 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MustItemCollectionViewCell.identifier, for: indexPath) as? MustItemCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let list = MustItemModel.dummy3()
            
            cell.mustitemconfigure(model: list[indexPath.row])
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}

