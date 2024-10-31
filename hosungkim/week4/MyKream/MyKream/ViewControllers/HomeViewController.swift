//
//  HomeViewController.swift
//  MyKream
//
//  Created by 김호성 on 2024.10.04.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        self.view = homeView
        print("HomeViewController")
        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        homeView.updateSelectedSegmentView(index: 0)
    }
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.segmentControl.addTarget(self, action: #selector(segmentControlValueChanged(segment:)), for: .valueChanged)
        view.cvMenu.dataSource = self
        view.tfSearch.delegate = self
        return view
    }()
    
    @objc private func segmentControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.cvMenu.isHidden = false
            homeView.ivAdvertisement.isHidden = false
        } else {
            homeView.cvMenu.isHidden = true
            homeView.ivAdvertisement.isHidden = true
        }
        UIView.animate(withDuration: 0.1, animations: {
            self.homeView.updateSelectedSegmentView(index: segment.selectedSegmentIndex)
            self.homeView.layoutIfNeeded()
        })
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MenuModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as? MenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = MenuModel.dummy()
        
        cell.ivImage.image = list[indexPath.row].image
        cell.lbTitle.text = list[indexPath.row].title
        
        return cell
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let viewController = SearchViewController()
        
        navigationController?.pushViewController(viewController, animated: false)
    }
}
