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
        
        self.view = homeView
        print("HomeViewController")
        // Do any additional setup after loading the view.
    }
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.segmentControl.addTarget(self, action: #selector(segmentControlValueChanged(segment:)), for: .valueChanged)
        view.cvMenu.dataSource = self
        return view
    }()
    
    @objc private func segmentControlValueChanged(segment: UISegmentedControl) {
        UIView.animate(withDuration: 0.1, animations: {
            self.homeView.selectedSegmentView.snp.updateConstraints({
                $0.leading.equalTo(segment.snp.leading).offset(Int(segment.bounds.width)/4/segment.numberOfSegments + Int(segment.bounds.width) * segment.selectedSegmentIndex / segment.numberOfSegments)
            })
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
