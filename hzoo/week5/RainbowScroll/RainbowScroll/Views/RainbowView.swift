//
//  RainbowView.swift
//  RainbowScroll
//
//  Created by 이현주 on 11/4/24.
//

import UIKit
import SnapKit

class RainbowView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let s = UIScrollView()
        s.showsVerticalScrollIndicator = true
        s.showsHorizontalScrollIndicator = false
        return s
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupColorViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    private func setupColorViews() {
        var previousView: UIView? = nil
        
        for color in RainbowColors.colors {
            let colorView = UIView()
            colorView.backgroundColor = color
            scrollView.addSubview(colorView)
            colorView.snp.makeConstraints { make in
                make.horizontalEdges.equalToSuperview()
                make.width.equalTo(self.snp.width)
                make.height.equalTo(176)
                
                if let previousView = previousView {
                    make.top.equalTo(previousView.snp.bottom)
                } else {
                    make.top.equalToSuperview()
                }
            }
            previousView = colorView
        }
        // 마지막 뷰의 하단을 스크롤뷰의 하단에 맞춤!
        if let lastView = previousView {
            lastView.snp.makeConstraints { make in
                make.bottom.equalToSuperview()
            }
        }
    }
}
