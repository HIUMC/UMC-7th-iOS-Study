//
//  purchaseDetailedViewCell.swift
//  Kream
//
//  Created by KoNangYeon on 11/14/24.
//

import UIKit

class customView : UIView, layerConfig {
    func configLayer(layerBorderWidth: CGFloat?, layerCornerRadius: CGFloat?, layerColor: UIColor?) {
        self.layer.borderWidth = layerBorderWidth!
        self.layer.cornerRadius = layerCornerRadius!
        self.layer.borderColor = layerColor?.cgColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class purchaseViewCell: UICollectionViewCell {
    
    static let identifier = "purchaseViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var backView = customView().then {
        $0.configLayer(layerBorderWidth: 1, layerCornerRadius: 10, layerColor: UIColor(hexCode: "F2F2F2"))
    }
  
    lazy var text1 = Label(title: "S", size: 14, weight: .regular, color: .black)
    
    lazy var text2 = Label(title: "S", size: 12, weight: .regular, color: UIColor(hue: 0.9972, saturation: 0.58, brightness: 0.85, alpha: 1.0))

    private func setupView() {
        addSubview(backView)
        addSubview(text1)
        addSubview(text2)

        backView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        text1.snp.makeConstraints{
            $0.top.equalToSuperview().inset(8)
            $0.centerX.equalToSuperview()
        }
        
        text2.snp.makeConstraints{
            $0.top.equalTo(text1.snp.bottom)
            $0.centerX.equalToSuperview()
        }
    }
}
