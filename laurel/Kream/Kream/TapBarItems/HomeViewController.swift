//
//  HomeViewController.swift
//  Kream
//
//  Created by 어진 on 10/9/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
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
        layout.minimumLineSpacing = 35
        layout.minimumInteritemSpacing = 10
        
        let numberOfItemsPerRow: CGFloat = 6
        let totalSpacing = (numberOfItemsPerRow - 1) * layout.minimumInteritemSpacing
        let itemWidth = (UIScreen.main.bounds.width - totalSpacing) / numberOfItemsPerRow
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
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
    

    private let justDroppedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 120, height: 200) // 셀 크기 조정
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupSearchBarLayout()
        setupSegmentControlLayout()
        setupHomeImageView()
        setupCollectionView()
        setupUnderlineLayout()
        setupJustDroppedCollectionView()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    private func setupSearchBarLayout() {
        contentView.addSubview(searchContainerView)
        contentView.addSubview(notificationButton)
        searchContainerView.addSubview(searchBar)
        
        searchContainerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(notificationButton.snp.leading).offset(-10)
            make.top.equalToSuperview().offset(10)
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
        contentView.addSubview(segmentControl)
        
        segmentControl.snp.makeConstraints { make in
            make.top.equalTo(searchContainerView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
    }
    
    private func setupUnderlineLayout() {
        underlineView.backgroundColor = .black
        contentView.addSubview(underlineView)
        
        updateUnderlinePosition()
    }
    
    private func setupHomeImageView() {
        contentView.addSubview(homeImageView)
        
        homeImageView.snp.makeConstraints { make in
            make.width.equalTo(374)
            make.height.equalTo(336)
            make.top.equalTo(segmentControl.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupCollectionView() {
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(homeImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(180)
        }
    }
    
    private func setupJustDroppedCollectionView() {
        contentView.addSubview(justDroppedCollectionView)
        justDroppedCollectionView.dataSource = self
        justDroppedCollectionView.delegate = self
        justDroppedCollectionView.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: JustDroppedCollectionViewCell.identifier)
        
        let sectionTitleLabel = UILabel()
        sectionTitleLabel.text = "Just Dropped"
        sectionTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        let detailLabel = UILabel()
        detailLabel.text = "발매상품"
        detailLabel.font = UIFont.systemFont(ofSize: 15)
        
        
        contentView.addSubview(sectionTitleLabel)
        contentView.addSubview(detailLabel)
        
        sectionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(sectionTitleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
        
        justDroppedCollectionView.snp.makeConstraints {
            $0.top.equalTo(detailLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(230)
            $0.bottom.equalToSuperview().offset(-20)
        }
       
    }
    
    @objc private func notificationButtonTapped() {
        // 알림 버튼 동작
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        updateUnderlinePosition()
    }
    
    private func updateUnderlinePosition() {
        let selectedIndex = segmentControl.selectedSegmentIndex
        let segmentWidth = segmentControl.frame.width / CGFloat(segmentControl.numberOfSegments)
        
        underlineView.snp.remakeConstraints {
            $0.top.equalTo(segmentControl.snp.bottom).offset(5)
            $0.height.equalTo(2)
            $0.width.equalTo(segmentWidth)
            $0.leading.equalTo(segmentControl.snp.leading).offset(CGFloat(selectedIndex) * segmentWidth)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == justDroppedCollectionView {
            return DummyJustDroppedData.items.count
        } else {
            return homeItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == justDroppedCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JustDroppedCollectionViewCell.identifier, for: indexPath) as? JustDroppedCollectionViewCell else {
                return UICollectionViewCell()
            }
            let item = DummyJustDroppedData.items[indexPath.item]
            cell.configure(with: item)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            let item = homeItems[indexPath.item]
            cell.configure(with: item)
            return cell
        }
    }
}
