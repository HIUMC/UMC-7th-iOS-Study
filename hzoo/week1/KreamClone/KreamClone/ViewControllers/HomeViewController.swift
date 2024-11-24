//
//  HomeViewController.swift
//  KreamClone
//
//  Created by 이현주 on 10/7/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view = homeView
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
      navigationController?.setNavigationBarHidden(true, animated: true) // 뷰 컨트롤러가 나타날 때 숨기기
    }
    
    private lazy var homeView: HomeView = {
        let hv =  HomeView()
        hv.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(segment: )), for: .valueChanged)
        hv.segmentedControl.addTarget(self, action: #selector(updateUnderlinePosition(segment: )), for: .valueChanged)
        hv.searchBtn.addTarget(self, action: #selector(goToSearchHome), for: .touchUpInside)
        
        hv.menuCollectionView.delegate = self
        hv.menuCollectionView.dataSource = self
        
        hv.droppedCollectionView.delegate = self
        hv.droppedCollectionView.dataSource = self
        
        hv.challengeCollectionView.delegate = self
        hv.challengeCollectionView.dataSource = self
        
        return hv
    }()
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.scrollView.isHidden = false
            homeView.contentView.isHidden = false
        }
        else {
            homeView.scrollView.isHidden = true
            homeView.contentView.isHidden = true
        }
    }
    
    @objc
    private func updateUnderlinePosition(segment: UISegmentedControl) {
        
        guard let selectedTitle = segment.titleForSegment(at: segment.selectedSegmentIndex) else { return }
        
        // 선택된 세그먼트의 텍스트 길이 계산을 위한 폰트 설정
        let font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        // 선택된 세그먼트 텍스트의 길이를 기준으로 밑줄 너비 설정 (여유 공간 없이 딱 맞게)
        let underlineWidth = selectedTitle.size(withAttributes: [.font: font]).width
        
        // 양쪽의 여백이 23이고, 세그먼트 간 간격도 23
        let segmentSpacing: CGFloat = 23.0
        var leadingDistance: CGFloat = segmentSpacing // 첫 번째 세그먼트 앞의 간격 추가
        
        // 현재 선택된 세그먼트 이전의 모든 세그먼트의 너비와 간격을 더함
        for index in 0..<segment.selectedSegmentIndex {
            if let title = segment.titleForSegment(at: index) {
                let titleWidth = title.size(withAttributes: [.font: font]).width
                leadingDistance += titleWidth + segmentSpacing
            }
        }
        leadingDistance -= 13.5
        
        // underLineView의 위치와 너비 업데이트
        homeView.underLineView.snp.remakeConstraints { make in
            make.leading.equalTo(homeView.segmentedControl.snp.leading).offset(leadingDistance)
            make.width.equalTo(underlineWidth)
            make.height.equalTo(2)
            make.top.equalTo(homeView.segmentedControl.snp.bottom)
        }
        
        // 애니메이션 적용
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc
    private func goToSearchHome() {
        //모달로 바꾸기
        let vc = SearchHomeViewController()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return MenuModel.list().count
        }
        else if collectionView.tag == 1 {
            return DroppedModel.list().count
        }
        else if collectionView.tag == 2 {
            return ChallengeModel.list().count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMenuCollectionViewCell.identifier, for: indexPath) as! HomeMenuCollectionViewCell
            let list = MenuModel.list()
            
            cell.image.image = list[indexPath.row].image
            cell.name.text = list[indexPath.row].name
            
            return cell
        }
        else if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DroppedCollectionViewCell.identifier, for: indexPath) as! DroppedCollectionViewCell
            let list = DroppedModel.list()
            
            cell.trade.text = "거래 " + list[indexPath.row].trade
            cell.image.image = list[indexPath.row].image
            cell.brand.text = list[indexPath.row].brand
            cell.name.text = list[indexPath.row].name
            cell.price.text = list[indexPath.row].price + "원"
                    
            return cell
        }
        else if collectionView.tag == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChallengeCollectionViewCell.identifier, for: indexPath) as! ChallengeCollectionViewCell
            let list = ChallengeModel.list()
            
            cell.image.image = list[indexPath.row].image
            cell.id.text = "@" + list[indexPath.row].id
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            let vc = ProductDetailViewController()
            vc.hidesBottomBarWhenPushed = true
//            vc.profileManageView.profileImg.image = mypageView.profileImg.image
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
