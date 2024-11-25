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
        let searchVC = UINavigationController(rootViewController: searchViewController())
        searchVC.modalPresentationStyle = .fullScreen
        present(searchVC, animated: false)
        //navigationController?.pushViewController(searchVC, animated: true)
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
    
    /*@objc // 모르겠다
    private func changeSegmentedControlLinePosition(_ segment: UISegmentedControl){
        let selectedIndex = homeView.segmentedControl.selectedSegmentIndex
        
        // 선택된 세그먼트의 프레임을 가져옴
        guard let selectedSegmentFrame = homeView.segmentedControl.subviews[selectedIndex].frame as CGRect? else {
            return
        }
        
        UIKit.UIView.animate(withDuration: 0.3) {
            // 언더바의 위치와 크기를 업데이트
            self.homeView.line.snp.updateConstraints {
                $0.leading.equalTo(self.homeView.segmentedControl).offset(selectedSegmentFrame.minX + 7.9)
                $0.width.equalTo(selectedSegmentFrame.width * 0.75)
            }
            self.homeView.layoutIfNeeded()
        }
    }*/
    
    private func setupAction() {
        homeView.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(segment:)), for: .valueChanged)
        //homeView.segmentedControl.addTarget(self, action: #selector(changeSegmentedControlLinePosition(_:)), for: .valueChanged)
        homeView.searchBar.addTarget(self, action:
                                        #selector(searchBarBtnDidTap), for: .editingDidBegin)
    }
    
    private func setupDelegate() {
        homeView.HOMECollectionView.dataSource = self
        homeView.HOMECollectionView2.dataSource = self
        homeView.HOMECollectionView3.dataSource = self
        
        homeView.HOMECollectionView2.delegate = self
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
                  
            cell.backView.backgroundColor = list[indexPath.row].color
            cell.image.image = list[indexPath.row].image
            cell.title.text = list[indexPath.row].title
            cell.smallTitle.text = list[indexPath.row].smallTitle
            cell.counts.text = list[indexPath.row].counts
            cell.price.text = list[indexPath.row].price
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

extension HOMEViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == homeView.HOMECollectionView2 {
            let VC = ProductDetailedViewController()
            VC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
}
