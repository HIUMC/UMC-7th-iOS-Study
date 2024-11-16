//
//  View.swift
//  project7
//
//  Created by KoNangYeon on 11/15/24.
//

import UIKit
import Then
import SnapKit

class View: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let textField = TextField().then {
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 14.0, height: 0.0))
        $0.leftViewMode = .always
        $0.isUserInteractionEnabled = true
        $0.configTextField(placeholder: "검색하고 싶은 것을 넣으세요!")
        $0.configLabel(text: "", size: 16, weight: .light, color: .black)
        $0.configLayer(layerBorderWidth: 2, layerCornerRadius: 10, layerColor: .black)
    }
    
    private let btn = CustomButton2().then {
        $0.configLabel(text: "검색", size: 12, weight: .regular, color: .black)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(hexCode: "D9D9D9")
    }
    
    private func setupView() {
        addSubview(textField)
        addSubview(btn)

        textField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(94)
            $0.left.equalToSuperview().inset(26)
            $0.width.equalTo(262)
            $0.height.equalTo(43)
        }
        
        btn.snp.makeConstraints{
            $0.top.equalToSuperview().inset(94)
            $0.left.equalTo(textField.snp.right).offset(21)
            $0.width.equalTo(58)
            $0.height.equalTo(43)
        }
    }
    
}
