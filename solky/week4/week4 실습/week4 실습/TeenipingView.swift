//
//  TeenipingView.swift
//  week4 실습
//
//  Created by 이태림 on 10/30/24.
//

import UIKit
import SnapKit
import Then

class TeenipingView: UIView {
    public lazy var segmentedControl = UISegmentedControl(items: ["티니핑", "not 티니핑"]).then {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        
        $0.apportionsSegmentWidthsByContent = true
        $0.selectedSegmentIndex = 0
        
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
    }
    
    let teenipingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 162, height: 144)
        $0.minimumLineSpacing = 12
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(TeenipingCollectionViewCell.self, forCellWithReuseIdentifier: TeenipingCollectionViewCell.identifier)
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
            teenipingCollectionView,
            divideLine,
            emptyLabel
        ].forEach {
            addSubview($0)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.leading.equalToSuperview().offset(92)
            $0.trailing.equalToSuperview().offset(-91)
            $0.height.equalTo(19)
        }
        
        divideLine.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        teenipingCollectionView.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(19)
            $0.bottom.equalToSuperview().inset(74)
        }
        
        emptyLabel.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(301)
            $0.centerX.equalToSuperview()
        }
    }
}
