//
//  View.swift
//  project7
//
//  Created by KoNangYeon on 11/15/24.
//

import UIKit
import Then
import SnapKit

class APITestView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addStack()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var textField = TextField().then {
        $0.configTextField(placeholder:  "검색하고 싶은 것을 넣으세요!", leftView: UIView(frame: CGRect(x: 0, y: 0, width: 14.0, height: 1)), leftViewMode: .always, interaction: true)
        $0.configLabel(text: "", size: 16, weight: .light, color: .black)
        $0.configLayer(layerBorderWidth: 2, layerCornerRadius: 10, layerColor: .black)
    }
    
    private lazy var text1 = Label(title: "타이틀", size: 20, weight: .bold)
    
    lazy var text2 = Label(title: "이 부분에 title 값이 들어오도록 해주세요!", size: 20, weight: .light)
    
    private lazy var text3 = Label(title: "컨텐츠", size: 20, weight: .bold)
    
    lazy var text4 = Label(title: "이 부분에 contents 값이 들어오도록 해주세요!", size: 20, weight: .light)
    
    lazy var btn = CustomButton2().then {
        $0.configLabel(text: "검색", size: 12, weight: .regular, color: .black)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(hexCode: "D9D9D9")
    }
    
    private lazy var inputStack = Stack(axis: .horizontal, spacing: 21)
    private lazy var titleLabelStack = Stack(axis: .vertical, spacing: 14)
    private lazy var contentLabelStack = Stack(axis: .vertical, spacing: 14)
    
    private func addStack() {
        [textField, btn].forEach{inputStack.addArrangedSubview($0)}
        [text1, text2].forEach{titleLabelStack.addArrangedSubview($0)}
        [text3, text4].forEach{contentLabelStack.addArrangedSubview($0)}
    }
    
    private func setupView() {
        [inputStack, titleLabelStack, contentLabelStack].forEach{addSubview($0)}
        
        inputStack.snp.makeConstraints{
            $0.top.equalToSuperview().inset(94)
            $0.horizontalEdges.equalToSuperview().inset(26)
            $0.height.equalTo(43)
        }
        
        textField.snp.makeConstraints{
            $0.width.equalTo(262)
        }
        
        titleLabelStack.snp.makeConstraints{
            $0.top.equalTo(inputStack.snp.bottom).offset(91)
            $0.horizontalEdges.equalToSuperview().inset(18.5)
            $0.height.equalTo(61)
        }
        
        contentLabelStack.snp.makeConstraints{
            $0.top.equalTo(titleLabelStack.snp.bottom).offset(91)
            $0.horizontalEdges.equalToSuperview().inset(18.5)
            $0.height.greaterThanOrEqualTo(10)
        }
    }
    
}
