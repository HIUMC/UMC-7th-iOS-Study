//
//  RainbowView.swift
//  project5
//
//  Created by KoNangYeon on 11/2/24.
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
    
    private lazy var scrollView = UIScrollView().then{
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = false
        $0.contentSize = CGSize(width: self.bounds.width, height: 1000)
    }
    
    private func setupView() {
        self.addSubview(scrollView)
        
        scrollView.snp.makeConstraints{
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    
    private func setupColorViews() {
        var previousView: UIView? = nil
        
        for color in RainbowColors.colors {
            let colorView = UIView()
            colorView.backgroundColor = color
            scrollView.addSubview(colorView)
            
            colorView.snp.makeConstraints{
                $0.height.equalTo(176)
                $0.width.equalTo(self.snp.width)
                $0.left.right.equalToSuperview()
                
                if let previousView = previousView {
                    $0.top.equalTo(previousView.snp.bottom)
                }else{//첫번째뷰
                    $0.top.equalToSuperview()
                }
            }
            
            previousView = colorView
        }
        
        if let lastView = previousView {
            lastView.snp.makeConstraints{
                $0.bottom.equalToSuperview()
            }
        }
        
    }

}
