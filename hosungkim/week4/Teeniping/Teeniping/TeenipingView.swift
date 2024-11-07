//
//  TeenipingView.swift
//  Teeniping
//
//  Created by 김호성 on 2024.10.29.
//

import UIKit
import SnapKit

class TeenipingView: UIView {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(segmentControl)
        self.addSubview(cvTeeniping)
        self.addSubview(divideLine)
        self.addSubview(lbEmpty)
        
        segmentControl.snp.makeConstraints({
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(92)
            $0.height.equalTo(65)
        })
        cvTeeniping.snp.makeConstraints({
            $0.top.equalTo(divideLine.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(19)
            $0.bottom.equalToSuperview().inset(74)
        })
        divideLine.snp.makeConstraints({
            $0.top.equalTo(segmentControl.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        })
        lbEmpty.snp.makeConstraints({
            $0.top.equalTo(divideLine.snp.bottom).offset(301)
            $0.centerX.equalToSuperview()
        })
    }
    
    public lazy var segmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["티니핑", "not 티니핑"])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentControl.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        segmentControl.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        segmentControl.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        
        segmentControl.setTitleTextAttributes(
            [
                .foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        segmentControl.setTitleTextAttributes(
            [
                .foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
        
        return segmentControl
    }()
    
    public lazy var cvTeeniping: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .init(width: 162, height: 144)
        layout.minimumInteritemSpacing = 12
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        collectionView.register(TeenipingCollectionViewCell.self, forCellWithReuseIdentifier: TeenipingCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    private lazy var divideLine: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        
        return view
    }()
    
    public lazy var lbEmpty: UILabel = {
       let label = UILabel()
        
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textColor = .black
        label.text = "휑~"
        label.isHidden = true
        
        return label
    }()
}
