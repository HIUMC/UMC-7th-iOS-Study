//
//  HomeViewController.swift
//  Kream
//
//  Created by KoNangYeon on 10/6/24.
//

import UIKit

class HOMEViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = homeView
        setupAction()
        setupDelegate()
    }
    
    private let homeView = HOMEView()

    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.HOMECollectionView.isHidden = false
            homeView.mainImage.isHidden = false
            homeView.divideLine.isHidden = false
        }
        else {
            homeView.HOMECollectionView.isHidden = true
            homeView.mainImage.isHidden = true
            homeView.divideLine.isHidden = true
        }
    }
    
    @objc // 모르겠다
    private func changeSegmentedControlLinePosition(_ segment: UISegmentedControl){
        let segmentIndex = CGFloat(homeView.segmentedControl.selectedSegmentIndex)
        let segmentWidth = 56.0
        let leadingDistance = segmentIndex * segmentWidth
        
        homeView.line.snp.updateConstraints{
            $0.leading.equalTo(homeView.segmentedControl).inset(leadingDistance)
            if homeView.segmentedControl.selectedSegmentIndex == 2{
                $0.width.equalTo(56)
            }else if (homeView.segmentedControl.selectedSegmentIndex == 3){
                $0.width.equalTo(42)
            }else {
                $0.width.equalTo(28)
            }
        }
            
        homeView.layoutIfNeeded()
    }
    
    private func setupAction() {
        homeView.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(segment:)), for: .valueChanged)
        homeView.segmentedControl.addTarget(self, action: #selector(changeSegmentedControlLinePosition(_:)), for: .valueChanged)
    }
    
    private func setupDelegate() {
        homeView.HOMECollectionView.dataSource = self
    }
    
    

}

extension HOMEViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HOMEModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HOMECollectionViewCell.identifier,
            for: indexPath //행 식별위해 파라미터로 받음
        ) as? HOMECollectionViewCell else {
                return UICollectionViewCell()
        }
        
        let list = HOMEModel.dummy()
                
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].name
        
        return cell
    }
}
