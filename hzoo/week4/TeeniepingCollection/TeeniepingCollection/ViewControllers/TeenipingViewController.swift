//
//  TeenipingViewController.swift
//  TeeniepingCollection
//
//  Created by 이현주 on 10/30/24.
//

import UIKit

class TeenipingViewController: UIViewController {

    private let rootView = TeenipingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = rootView
        
        setUpAction()
        setUpDelegate()
    }
    
    private func setUpAction() {
        rootView.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(segment: )), for: .valueChanged)
    }
    
    private func setUpDelegate() {
        rootView.teenipingCollectionView.dataSource = self
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
}

extension TeenipingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        TeenipingModel.dumy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TeenipingCollectionViewCell.identifier,
            for: indexPath
        ) as? TeenipingCollectionViewCell else {
            return UICollectionViewCell()
        }
        let list = TeenipingModel.dumy()
        
        cell.image.image = list[indexPath.row].image
        cell.name.text = list[indexPath.row].name
        
        return cell
    }

}
