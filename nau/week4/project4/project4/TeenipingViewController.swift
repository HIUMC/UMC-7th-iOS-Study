//
//  TeenipingViewController.swift
//  project4
//
//  Created by KoNangYeon on 10/29/24.
//

import UIKit

class TeenipingViewController: UIViewController {
    private let rootView = TeenipingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = rootView
        
        setupAction()
        setupDelegate()
    }
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            rootView.teenipingCollectionView.isHidden = false
            rootView.emptyLabel.isHidden = true
        }
        else {
            rootView.teenipingCollectionView.isHidden = true
            rootView.emptyLabel.isHidden = false
        }
    }
    
    private func setupAction() {
        rootView.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(segment:)), for: .valueChanged)
    }
    
    private func setupDelegate() {
        rootView.teenipingCollectionView.dataSource = self
    }

}

extension TeenipingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TeenipingModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeenipingCollectionViewCell.identifier,
            for: indexPath //행 식별위해 파라미터로 받음
        ) as? TeenipingCollectionViewCell else {
                return UICollectionViewCell()
        }
        
        let list = TeenipingModel.dummy()
                
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].name
        
        return cell
    }
    
    
}
