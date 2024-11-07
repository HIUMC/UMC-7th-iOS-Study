//
//  HomeViewController.swift
//  Kream
//
//  Created by 어진 on 10/9/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private lazy var searchContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        searchBar.searchBarStyle = .minimal
        searchBar.isTranslucent = true
        searchBar.layer.cornerRadius = 10
        searchBar.clipsToBounds = true
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField,
           let iconView = textField.leftView as? UIImageView {
            iconView.isHidden = true // 돋보기 아이콘 숨김
        }
        return searchBar
    }()
    
    private lazy var notificationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(notificationButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var segmentControl: UISegmentedControl = {
        let items = ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
        let segmentControl = UISegmentedControl(items: items)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentControl.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        segmentControl.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        segmentControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        segmentControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        return segmentControl
    }()
    
    private let underlineView = UIView()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
       
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 10
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private let homeItems = DummyHomeData.HomeItems
    
    private lazy var homeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "homeImage")
        imageView.alpha = 1.0
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBarLayout()
        setupSegmentControlLayout()
        setupHomeImageView()
        
        setupCollectionView()
        setupUnderlineLayout()
    }
    
    private func setupHomeImageView() {
        view.addSubview(homeImageView)
        
        homeImageView.snp.makeConstraints { make in
            make.width.equalTo(374)
            make.height.equalTo(336)
            make.top.equalTo(segmentControl.snp.bottom).offset(20) // 세그먼트 아래에 배치
            make.centerX.equalToSuperview()
        }
    }
    private func setupSearchBarLayout() {
        view.addSubview(searchContainerView)
        view.addSubview(notificationButton)
        searchContainerView.addSubview(searchBar)
        
        searchContainerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(notificationButton.snp.leading).offset(-10)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.width.equalTo(303)
            make.height.equalTo(40)
        }
        
        searchBar.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        
        notificationButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalTo(searchContainerView)
            make.width.height.equalTo(24)
        }
    }
    
    private func setupSegmentControlLayout() {
        view.addSubview(segmentControl)
        
        segmentControl.snp.makeConstraints { make in
            make.top.equalTo(searchContainerView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
    }
    
    private func setupUnderlineLayout() {
        underlineView.backgroundColor = .black
        view.addSubview(underlineView)
        
        updateUnderlinePosition()
    }
    
    @objc private func notificationButtonTapped() {
        // 알림 버튼이 눌렸을 때의 동작을 여기에 구현
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        updateUnderlinePosition()
    }
    
    private func updateUnderlinePosition() {
        let selectedIndex = segmentControl.selectedSegmentIndex
        let segmentWidth = segmentControl.frame.width / CGFloat(segmentControl.numberOfSegments)
        
        underlineView.snp.remakeConstraints { make in
            make.top.equalTo(segmentControl.snp.bottom).offset(5)
            make.height.equalTo(2)
            make.width.equalTo(segmentWidth)
            make.leading.equalTo(segmentControl.snp.leading).offset(CGFloat(selectedIndex) * segmentWidth)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(homeImageView.snp.bottom).offset(20) // homeImageView 아래에 배치
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-20)

        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let item = homeItems[indexPath.item]
        cell.configure(with: item)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing = 40.0 // 좌우 여백 20 + 셀 사이 간격
        let width = (collectionView.frame.width - totalSpacing) / 5
        return CGSize(width: width, height: width) // 정사각형 셀로 설정
    }
}
