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
        
        navigationController?.isNavigationBarHidden = true
    }
    
    private let homeView = HOMEView()
    
    @objc
    private func searchBarBtnDidTap(){
        let searchVC = searchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }

    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        homeView.topView.isHidden = false
        if homeView.segmentedControl.selectedSegmentIndex == 0 {
            homeView.bottomView.isHidden = false
        }
        else {
            homeView.bottomView.isHidden = true
        }
    }
    
    @objc // 모르겠다
    private func changeSegmentedControlLinePosition(_ segment: UISegmentedControl){
        guard let segmentIndex = homeView.segmentedControl.titleForSegment(at: homeView.segmentedControl.selectedSegmentIndex) else { return }
        let segmentWidth = (homeView.segmentedControl.frame.width / CGFloat(homeView.segmentedControl.numberOfSegments))
        let segmentFrame = CGRect(
            x: segmentWidth * CGFloat(homeView.segmentedControl.selectedSegmentIndex),
            y: homeView.segmentedControl.frame.height,
            width: segmentWidth,
            height: 2
        
        
        homeView.line.snp.updateConstraints{
            $0.leading.equalTo(homeView.segmentedControl).inset(leadingDistance+9)
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
        homeView.searchBar.addTarget(self, action:
                                        #selector(searchBarBtnDidTap), for: .editingDidBegin)
    }
    
    private func setupDelegate() {
        homeView.HOMECollectionView.dataSource = self
        homeView.HOMECollectionView2.dataSource = self
        homeView.HOMECollectionView3.dataSource = self
    }
    
    

}

extension HOMEViewController: UICollectionViewDataSource {//switch문 이용해서..
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case homeView.HOMECollectionView:
            return HOMEModel.dummy().count
        case homeView.HOMECollectionView2:
            return HOMEModel2.dummy().count
        case homeView.HOMECollectionView3:
            return HOMEModel3.dummy().count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case homeView.HOMECollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HOMECollectionViewCell.identifier,
                for: indexPath //행 식별위해 파라미터로 받음
            ) as? HOMECollectionViewCell else {
                    return UICollectionViewCell()
            }
            
            let list = HOMEModel.dummy()
                    
            cell.imageView.image = list[indexPath.row].image
            cell.titleLabel.text = list[indexPath.row].name
            
            return cell
            
        case homeView.HOMECollectionView2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HOMECollectionViewCell2.identifier,
                for: indexPath //행 식별위해 파라미터로 받음
            ) as? HOMECollectionViewCell2 else {
                    return UICollectionViewCell()
            }
            
            let list = HOMEModel2.dummy()
                    
            cell.image.image = list[indexPath.row].image
            cell.title.text = list[indexPath.row].title
            cell.smallTitle.text = list[indexPath.row].smallTitle
            cell.counts.text = list[indexPath.row].counts
            cell.price.text = list[indexPath.row].price
            cell.savedImage.image = list[indexPath.row].saveImage
            cell.realPrice.text = list[indexPath.row].realPrice
            
            return cell
            
        case homeView.HOMECollectionView3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HOMECollectionViewCell3.identifier,
                for: indexPath //행 식별위해 파라미터로 받음
            ) as? HOMECollectionViewCell3 else {
                    return UICollectionViewCell()
            }
            
            let list = HOMEModel3.dummy()
                    
            cell.image.image = list[indexPath.row].image
            cell.instaId.text = list[indexPath.row].instaId
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}


