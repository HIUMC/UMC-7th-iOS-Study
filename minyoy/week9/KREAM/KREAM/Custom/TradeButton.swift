//
//  TradeButton.swift
//  KREAM
//
//  Created by 주민영 on 11/9/24.
//

import UIKit

class TradeButton: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        guard let view = setupView() else { return }
        self.addSubview(view)
    }
    
    init(backGroundColor: UIColor, title: String, price: String, sub: String, subTitleColor: UIColor) {
        super.init(frame: .zero)
        tradeBtn.backgroundColor = backGroundColor
        leftTitle.text = title
        rightTitle.text = price
        subTitle.text = sub
        subTitle.textColor = subTitleColor
        guard let view = setupView() else { return }
        self.addSubview(view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var tradeBtn = UIView().then {
        $0.backgroundColor = UIColor(red: 239/255, green: 98/255, blue: 84/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.isUserInteractionEnabled = true
    }
    
    var leftTitle = UILabel().then {
        $0.text = "구매"
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .white
    }
    
    var rightTitle = UILabel().then {
        $0.text = "345,000"
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
        $0.textColor = .white
    }
    
    var subTitle = UILabel().then {
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = UIColor(red: 163/255, green: 55/255, blue: 35/255, alpha: 1)
    }

    func setupView() -> UIView? {
        addSubview(tradeBtn)
        tradeBtn.addSubview(leftTitle)
        tradeBtn.addSubview(rightTitle)
        tradeBtn.addSubview(subTitle)
        
        tradeBtn.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(147)
            $0.height.equalTo(49)
        }
        
        leftTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(10)
        }
        
        rightTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalTo(leftTitle.snp.trailing).offset(21)
        }
        
        subTitle.snp.makeConstraints {
            $0.top.equalTo(rightTitle.snp.bottom).offset(2)
            $0.leading.equalTo(rightTitle.snp.leading)
        }
        
        return tradeBtn
    }

}
