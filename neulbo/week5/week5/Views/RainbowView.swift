//
//  RainbowView.swift
//  week5
//
//  Created by 김서현 on 11/3/24.
//

import UIKit
import Then
import SnapKit

class RainbowView: UIView {
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
            setupColorViews()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    private lazy var scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = false
    }
    
    private func setupView() {
        self.addSubview(scrollView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    private func setupColorViews() {
        var previousView: UIView? = nil
        
        for color in RainbowColors.colors {
            let colorView = UIView()
            colorView.backgroundColor = color
            scrollView.addSubview(colorView)
            
            colorView.snp.makeConstraints {
                $0.left.right.equalToSuperview()
                $0.width.equalTo(self.snp.width)
                $0.height.equalTo(176)
                
                if let previousView = previousView {
                    $0.top.equalTo(previousView.snp.bottom)
                } else {
                    $0.top.equalToSuperview()
                }
            }
            
            previousView = colorView
        }
        
        if let lastView = previousView {
            lastView.snp.makeConstraints {
                $0.bottom.equalToSuperview()
            }
        }
    }
}
