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
    }
    
    private lazy var homeView: HomeView = {
        let hv =  HomeView()
        hv.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(segment: )), for: .valueChanged)
        hv.segmentedControl.addTarget(self, action: #selector(updateUnderlinePosition(segment: )), for: .valueChanged)
        hv.menuCollectionView.delegate = self
        hv.menuCollectionView.dataSource = self
        return hv
    }()
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.adImg.isHidden = false
            homeView.menuCollectionView.isHidden = false
        }
        else {
            homeView.adImg.isHidden = true
            homeView.menuCollectionView.isHidden = true
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
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MenuModel.list().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeMenuCollectionViewCell.identifier,
            for: indexPath
        ) as? HomeMenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        let list = MenuModel.list()
        
        cell.image.image = list[indexPath.row].image
        cell.name.text = list[indexPath.row].name
        
        return cell
    }
}
