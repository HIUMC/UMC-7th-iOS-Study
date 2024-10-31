//
//  HOMEView.swift
//  Kream
//
//  Created by KoNangYeon on 10/31/24.
//

import UIKit
import Then
import SnapKit

class HOMEView: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var bellBtn = UIButton().then {
        $0.setImage(UIImage(named: "icon_alert_none"), for: .normal)
    }
    
    private lazy var searchBar = UITextField().then{
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.font = UIFont.systemFont(ofSize: 13.5, weight: .regular)
        $0.layer.cornerRadius = 12
        $0.layer.backgroundColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 96/100, alpha: 1.0).cgColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        $0.leftViewMode = .always
    }
    
    let segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then{
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.apportionsSegmentWidthsByContent = true //아이템 폭이 내용에 맞춰 자동 조절
        $0.selectedSegmentIndex = 0 //앱 실행됐을때 선택할 인덱t=스
            
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
    
    let line = UIView().then {
        $0.backgroundColor = .black
    }
    
    let HOMECollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumInteritemSpacing = 9
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(HOMECollectionViewCell.self, forCellWithReuseIdentifier: HOMECollectionViewCell.identifier)
    }
    
    let mainImage = UIImageView().then{
        $0.image = UIImage(named: "image_ad_none")
    }
    
    lazy var divideLine = UIView().then{
        $0.backgroundColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 94/100, alpha: 1.0)
    }
    
    
    private func setupView(){
        [
            bellBtn,
            searchBar,
            segmentedControl,
            line,
            mainImage,
            HOMECollectionView,
            divideLine
        ].forEach{
            addSubview($0)
        }
        
        bellBtn.snp.makeConstraints{
            $0.top.equalToSuperview().inset(59)
            $0.right.equalToSuperview().inset(16)
            $0.height.width.equalTo(24)
        }
        
        searchBar.snp.makeConstraints{
            $0.top.equalToSuperview().inset(51)
            $0.left.equalToSuperview().inset(16)
            $0.right.equalTo(bellBtn.snp.left).offset(-16)
            $0.height.equalTo(40)
        }
        
        segmentedControl.snp.makeConstraints{
            $0.top.equalTo(searchBar.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(27)
        }
        
        line.snp.makeConstraints{
            $0.top.equalTo(segmentedControl.snp.bottom).offset(8)
            $0.height.equalTo(2)
            $0.leading.equalTo(segmentedControl.snp.leading)
            $0.width.equalTo(28)
        }
        
        mainImage.snp.makeConstraints{
            $0.top.equalTo(line.snp.bottom)
        }
        
        HOMECollectionView.snp.makeConstraints{
            $0.top.equalTo(mainImage.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(138)
        }
        
        divideLine.snp.makeConstraints{
            $0.top.equalTo(HOMECollectionView.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
