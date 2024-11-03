//
//  HomeView.swift
//  MyKream
//
//  Created by 김호성 on 2024.10.29.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    private var segmentWidth: [CGFloat] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        
        for subview in segmentControl.subviews {
            guard let imageView = subview as? UIImageView else { return }
            if !imageView.isUserInteractionEnabled {
                segmentWidth.append(imageView.frame.width)
            }
        }
    }
    
    func updateSelectedSegmentView(index: Int) {
        selectedSegmentView.snp.remakeConstraints({
            $0.top.equalTo(segmentControl.snp.bottom).offset(8)
            $0.leading.equalTo(segmentControl.snp.leading).offset(segmentWidth.prefix(index).reduce(0, +) + segmentWidth[index]*0.2)
            $0.width.equalTo(segmentWidth[index]*0.6)
            $0.height.equalTo(2)
        })
    }
    func updateContainerView(index: Int) {
        self.containerView.subviews.forEach({
            $0.removeFromSuperview()
        })
        if segmentControl.selectedSegmentIndex == 0 {
            self.containerView.addSubview(self.recommendView)
            recommendView.snp.remakeConstraints({
                $0.width.equalTo(self.bounds.width)
                $0.top.bottom.leading.trailing.equalToSuperview()
            })
        } else {
            self.containerView.addSubview(self.blankView)
            blankView.snp.remakeConstraints({
                $0.width.equalTo(self.bounds.width)
                $0.top.bottom.leading.trailing.equalToSuperview()
            })
        }
    }
    
    private func addComponents() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(tfSearch)
        contentView.addSubview(btnNotification)
        contentView.addSubview(segmentControl)
        contentView.addSubview(selectedSegmentView)
        contentView.addSubview(containerView)
        containerView.addSubview(recommendView)
        containerView.addSubview(blankView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.height.equalToSuperview()
        }
        contentView.snp.makeConstraints({
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        })
        tfSearch.snp.makeConstraints({
            $0.top.equalToSuperview().inset(6)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        })
        btnNotification.snp.makeConstraints({
            $0.centerY.equalTo(tfSearch.snp.centerY)
            $0.width.height.equalTo(24)
            $0.leading.equalTo(tfSearch.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().inset(16)
        })
        segmentControl.snp.makeConstraints({
            $0.top.equalTo(tfSearch.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(27)
        })
        selectedSegmentView.snp.makeConstraints({
            $0.top.equalTo(segmentControl.snp.bottom).offset(8)
            $0.leading.equalTo(segmentControl.snp.leading).offset(Int(segmentControl.bounds.width)/5/segmentControl.numberOfSegments)
            
            $0.width.equalTo(segmentControl.snp.width).multipliedBy(3.0/(5.0*CGFloat(segmentControl.numberOfSegments)))
            $0.height.equalTo(2)
        })
        containerView.snp.makeConstraints({
            $0.top.equalTo(selectedSegmentView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(self.bounds.width)
            $0.bottom.equalToSuperview()
        })
        recommendView.snp.makeConstraints({
            $0.width.equalTo(self.bounds.width)
            $0.top.bottom.leading.trailing.equalToSuperview()
        })
        blankView.snp.makeConstraints({
            $0.width.equalTo(self.bounds.width)
            $0.top.bottom.leading.trailing.equalToSuperview()
        })
        blankView.removeFromSuperview()
    }
    
    public lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bouncesVertically = true
//        scrollView.contentSize =
        return scrollView
    }()
    public lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    public lazy var tfSearch: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "브랜드, 상품, 프로필, 태그 등", attributes: [.foregroundColor: UIColor(red: 182/255, green: 182/255, blue: 182/255, alpha: 1)])
        textField.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        textField.layer.cornerRadius = 12
        textField.font = UIFont.systemFont(ofSize: 13.5)
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        
        return textField
    }()
    
    private lazy var btnNotification: UIButton = {
        let button = UIButton()
        button.setImage(.iconAlert, for: .normal)
        return button
    }()
    
    public lazy var segmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"])
        segmentControl.selectedSegmentIndex = 0
        let image = UIImage()
        segmentControl.setBackgroundImage(image, for: .normal, barMetrics: .default)
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
        segmentControl.apportionsSegmentWidthsByContent = true
        
        return segmentControl
    }()
    public lazy var selectedSegmentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    public lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    public lazy var recommendView: RecommendView = {
        let view = RecommendView()
        return view
    }()
    public lazy var blankView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
}
