//
//  TeenipingView.swift
//  week4
//
//  Created by 김서현 on 10/28/24.
//

import UIKit
import Then
import SnapKit

class TeenipingView: UIView {
    
    let segmentedControl = UISegmentedControl(items: ["티니핑", "not 티니핑"]).then {
        let backgroundColor = UIImage(color: .clear, size: CGSize(width: 50, height: 20))

        $0.setBackgroundImage(backgroundColor, for: .normal, barMetrics: .default)
        $0.setBackgroundImage(backgroundColor, for: .selected, barMetrics: .default)
        $0.setBackgroundImage(backgroundColor, for: .highlighted, barMetrics: .default)
        $0.setDividerImage(backgroundColor, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
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
    
    let teenipingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({
        $0.estimatedItemSize = .init(width: 162, height: 144)
        $0.minimumInteritemSpacing = 12
    })).then {
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
        $0.text = "휑~~"
        $0.isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init method not implemented")
    }
    
    
    private func setUpView() {
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
            $0.leading.trailing.equalTo(safeAreaInsets).inset(20)
            $0.centerX.equalToSuperview()
        }
        
        divideLine.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        teenipingCollectionView.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
        
        emptyLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}

extension UIImage {

    convenience init(color: UIColor, size: CGSize) {

        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        color.set()
        let context = UIGraphicsGetCurrentContext()!
        context.fill(CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.init(data: image.pngData()!)!
    }
}
