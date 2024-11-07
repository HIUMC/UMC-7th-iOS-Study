//
//  ViewController.swift
//  Teeniping
//
//  Created by 김호성 on 2024.10.29.
//

import UIKit

class TeenipingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = teenipingView
    }
    
    private lazy var teenipingView: TeenipingView = {
        let view = TeenipingView()
        view.segmentControl.addTarget(self, action: #selector(segmentControlValueChanged(segment:)), for: .valueChanged)
        view.cvTeeniping.dataSource = self
        return view
    }()
    
    @objc private func segmentControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            teenipingView.cvTeeniping.isHidden = false
            teenipingView.lbEmpty.isHidden = true
        } else {
            teenipingView.cvTeeniping.isHidden = true
            teenipingView.lbEmpty.isHidden = false
        }
    }
}

extension TeenipingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TeenipingModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeenipingCollectionViewCell.identifier, for: indexPath) as? TeenipingCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = TeenipingModel.dummy()
        
        cell.ivImage.image = list[indexPath.row].image
        cell.lbTitle.text = list[indexPath.row].name
        
        return cell
    }
}

