//
//  SearchResultViewController.swift
//  cloneKream
//
//  Created by 김서현 on 11/4/24.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController, UISearchBarDelegate {
    
    private let rootView = HomeView()
    private var underbarAnimator: UnderbarAnimator?
    private var segmentedControlManager: SegmentedControlManager?
    
    private lazy var searchController = UISearchController().then {
        $0.searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.searchBar.setImage(UIImage(), for: .search, state: .normal)
        $0.hidesNavigationBarDuringPresentation = false
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view = rootView
        
        setUpDelegate()
        
        rootView.menuCollectionView.tag = 0
        rootView.justDroppedCollectionView.tag = 1
        rootView.challengeCollectionView.tag = 2
        
        
        self.navigationItem.titleView = searchController.searchBar
        self.definesPresentationContext = true
        
        let alarmBarButton = UIBarButtonItem(image: .searchBarIcon, style: .plain, target: self, action: #selector(alarmButtonTapped))
        self.navigationItem.rightBarButtonItem  = alarmBarButton
    
        
        // UnderbarAnimator와 SegmentedControlManager 초기화
        underbarAnimator = UnderbarAnimator(underBarView: rootView.underBar, segmentedControl: rootView.segmentedControl)
        segmentedControlManager = SegmentedControlManager(segmentedControl: rootView.segmentedControl, underbarAnimator: underbarAnimator ?? UnderbarAnimator(underBarView: rootView.underBar, segmentedControl: rootView.segmentedControl))
    }
    
    
    @objc private func alarmButtonTapped() {
        
    }
    
    /*private func setupAction() {
        rootView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
        
        rootView.segmentedControl.addTarget(
            self,
            action: #selector(moveUnderbar(segment:)),
            for: .valueChanged
        )
    }
    
    
    @objc
        private func segmentedControlValueChanged(segment: UISegmentedControl) {
            if segment.selectedSegmentIndex == 0 {
                rootView.contentView.isHidden = false
            }
            else {
                rootView.contentView.isHidden = true
            }
        }
    
    @objc
        private func moveUnderbar(segment: UISegmentedControl) {
           
            let indexNow = Int(segment.selectedSegmentIndex)
            guard let selectedTitle = segment.titleForSegment(at: indexNow) else { return }
            let widthAtIndex = selectedTitle.size(withAttributes: [.font: UIFont.systemFont(ofSize: 16, weight: .bold)]).width
            var finalInset = 13
            
            for i in 0..<indexNow {
                guard let previousTitle = segment.titleForSegment(at: i) else { return }
                let widthAtPrevious = previousTitle.size(withAttributes: [.font: UIFont.systemFont(ofSize: 16, weight: .bold)]).width
                finalInset += Int(widthAtPrevious)
                finalInset += 32
                
            }
            
            UIView.animate(withDuration: 0.2) {
                self.rootView.underBar.snp.updateConstraints {
                    $0.leading.equalToSuperview().inset(finalInset)
                    $0.width.equalTo(widthAtIndex)
                }
                self.view.layoutIfNeeded()
            }
        }*/
    
    /*func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
            self.present(UINavigationController(rootViewController: RecommenedViewController()), animated: true, completion: nil)
            searchBar.setShowsCancelButton(false, animated: true)
            return false
        }*/
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let recommendedViewController = RecommenedViewController()
        navigationController?.pushViewController(recommendedViewController, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = ""
        searchBar.showsCancelButton = false
    }
    
    

    private func setUpDelegate() {
        rootView.menuCollectionView.dataSource = self
        rootView.justDroppedCollectionView.dataSource = self
        rootView.challengeCollectionView.dataSource = self
        
        searchController.searchBar.delegate = self
    }

}




extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 0 {
            return HomeMenuModel.dummy().count
        } else if collectionView.tag == 1 {
            return JustDroppedModel.dummy().count
        } else if collectionView.tag == 2 {
            return ChallengeModel.dummy().count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView.tag == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMenuCollectionViewCell.identifier, for: indexPath) as? HomeMenuCollectionViewCell else { return UICollectionViewCell() }
            let list = HomeMenuModel.dummy()
            cell.imageView.image = list[indexPath.row].image
            cell.menu.text = list[indexPath.row].title
            return cell
        } else if collectionView.tag == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JustDroppedCollectionViewCell.identifier, for: indexPath) as? JustDroppedCollectionViewCell else { return UICollectionViewCell() }
            let list = JustDroppedModel.dummy()
            cell.loadImage(from: list[indexPath.row].image)
            cell.brandLabel.text = list[indexPath.row].brandName
            cell.productLabel.text = list[indexPath.row].productName
            cell.priceLabel.text = "\(list[indexPath.row].price)원"
            cell.tradingLabel.text = "거래 \(list[indexPath.row].tradingRate)만"
            return cell
        } else if collectionView.tag == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChallengeCollectionViewCell.identifier, for: indexPath) as? ChallengeCollectionViewCell else { return UICollectionViewCell() }
            let list = ChallengeModel.dummy()
            cell.loadImage(from: list[indexPath.row].image)
            cell.userId.text = list[indexPath.row].userId
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    
}


