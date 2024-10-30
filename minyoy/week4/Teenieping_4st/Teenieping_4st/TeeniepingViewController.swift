//
//  TeeniepingViewController.swift
//  Teenieping_4st
//
//  Created by 주민영 on 10/28/24.
//

import UIKit

import SnapKit
import Then

class TeeniepingViewController: UIViewController {
    private let rootView = TeeniepingView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view = rootView
        
        setupAction()
        setupDelegate()
    }
    
    private func setupAction() {
        rootView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    
    private func setupDelegate() {
        rootView.teeniepingCollectionView.dataSource = self
    }
    
    @objc private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            rootView.teeniepingCollectionView.isHidden = false
            rootView.emptyLabel.isHidden = true
        }
        else {
            rootView.teeniepingCollectionView.isHidden = true
            rootView.emptyLabel.isHidden = false
        }
    }
}

extension TeeniepingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TeeniepingModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TeeniepingCollectionViewCell.identifier,
            for: indexPath
        ) as? TeeniepingCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = TeeniepingModel.dummy()
        
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].name
        
        return cell
    }
}
