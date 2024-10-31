//
//  TeeniepingView.swift
//  Teenieping_4st
//
//  Created by 주민영 on 10/28/24.
//

import UIKit

class TeeniepingView: UIView {
    let segmentedControl = UISegmentedControl(items: ["티니핑", "not 티니핑"]).then {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.selectedSegmentIndex = 0
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
    }
    
    let teeniepingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 162, height: 144)
        $0.minimumInteritemSpacing = 12
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(TeeniepingCollectionViewCell.self, forCellWithReuseIdentifier: TeeniepingCollectionViewCell.identifier)
    }
    
    private let divideLine = UIView().then {
        $0.backgroundColor = .black
    }
    
    let emptyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .medium)
        $0.textColor = .black
        $0.text = "휑~"
        $0.isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        [
            segmentedControl,
            teeniepingCollectionView,
            divideLine,
            emptyLabel
        ].forEach {
            addSubview($0)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(19)
        }
        
        divideLine.snp.makeConstraints{
            $0.top.equalTo(segmentedControl.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
       teeniepingCollectionView.snp.makeConstraints{
            $0.top.equalTo(divideLine.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(336)
            $0.height.equalTo(612)
        }
        
        emptyLabel.snp.makeConstraints{
            $0.top.equalTo(divideLine.snp.bottom).offset(301)
            $0.centerX.equalToSuperview()
        }
    }
}
