//
//  purchaseView.swift
//  Kream
//
//  Created by KoNangYeon on 11/10/24.
//

import UIKit
import Then
import SnapKit

class purchaseView: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let productDetailedView = ProductDetailedView()
    
    lazy var backBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "multiply"), for: .normal)
        $0.tintColor = .black
    }
    
    private lazy var text1 = UILabel().then {
        $0.text = "구매하기"
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .black
    }
    
    private lazy var text2 = UILabel().then {
        $0.text = "(가격 단위: 원)"
        $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        $0.textColor = UIColor(hue: 0, saturation: 0, brightness: 0.57, alpha: 1.0)
    }
    
    private lazy var image = UIImageView().then {
        $0.image = productDetailedView.mainImage.image
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    private lazy var text3 = UILabel().then {
        $0.text = productDetailedView.text3.text
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .black
    }
    
    private lazy var text4 = productDetailedView.text4
    
    
    func sizeButton(size: String, price: String) -> UIButton {
        lazy var Btn = UIButton().then {
            var config = UIButton.Configuration.plain()
            $0.layer.cornerRadius = 10
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(hue: 0, saturation: 0, brightness: 0.94, alpha: 1.0).cgColor
            
            config.attributedTitle = AttributedString(size, attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 14, weight: .regular), .foregroundColor: UIColor(.black)]))
            config.titleAlignment = .center
            
            config.attributedSubtitle = AttributedString(price, attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 10, weight: .regular), .foregroundColor: UIColor(hue: 0.9972, saturation: 0.58, brightness: 0.85, alpha: 1.0)]))
            config.titlePadding = 0
            
            $0.snp.makeConstraints{
                $0.width.equalTo(110)
                $0.height.equalTo(47)
            }
            
            $0.configuration = config
        }
        
        return Btn
    }
    
    lazy var buttons = [sizeBtn1, sizeBtn2, sizeBtn3, sizeBtn4, sizeBtn4, sizeBtn5]

    lazy var sizeBtn1 = sizeButton(size: "S", price: "360,000")
    lazy var sizeBtn2 = sizeButton(size: "M", price: "360,000")
    lazy var sizeBtn3 = sizeButton(size: "L", price: "360,000")
    lazy var sizeBtn4 = sizeButton(size: "XL", price: "360,000")
    lazy var sizeBtn5 = sizeButton(size: "XXL", price: "360,000")
    
    private lazy var purchaseBtn = UIButton().then {
        var config = UIButton.Configuration.plain()
        $0.backgroundColor = UIColor(hue: 0.0139, saturation: 0.64, brightness: 0.93, alpha: 1.0)
        $0.layer.cornerRadius = 10
        
        config.attributedTitle = AttributedString("345,000", attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 14, weight: .semibold), .foregroundColor: UIColor(.white)]))
        config.titleAlignment = .center
        
        config.attributedSubtitle = AttributedString("빠른배송(1-2일 소요)", attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 10, weight: .regular), .foregroundColor: UIColor(hue: 0.0389, saturation: 0.27, brightness: 1, alpha: 1.0)]))
        config.titlePadding = 0
        
        $0.configuration = config
    }
    
    private lazy var saleBtn = UIButton().then {
        var config = UIButton.Configuration.plain()
        $0.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.13, alpha: 1.0)
        $0.layer.cornerRadius = 10
        
        config.attributedTitle = AttributedString("407,000", attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 14, weight: .semibold), .foregroundColor: UIColor(.white)]))
        config.titleAlignment = .center
        
        config.attributedSubtitle = AttributedString("빠른배송(1-2일 소요)", attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 10, weight: .regular), .foregroundColor: UIColor(hue: 0, saturation: 0, brightness: 0.88, alpha: 1.0)]))
        config.titlePadding = 0
        
        $0.configuration = config
    }
    
    private lazy var line = UIView().then {
        $0.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.9, alpha: 1.0)
    }
    
    public lazy var CustomtabBar = UIView().then {
        $0.backgroundColor = .white
    }

    private func setupView() {
        [
            backBtn,
            text1,
            text2,
            image,
            text3,
            text4,
            sizeBtn1,
            sizeBtn2,
            sizeBtn3,
            sizeBtn4,
            sizeBtn5,
            line,
            CustomtabBar
        ].forEach{
            addSubview($0)
        }
        
        CustomtabBar.addSubview(saleBtn)
        CustomtabBar.addSubview(purchaseBtn)
        
        backBtn.snp.makeConstraints{
            $0.top.equalToSuperview().inset(20)
            $0.right.equalToSuperview().inset(16)
            $0.width.height.equalTo(20)
        }
        
        text1.snp.makeConstraints{
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        
        text2.snp.makeConstraints{
            $0.top.equalTo(text1.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        image.snp.makeConstraints{
            $0.top.equalTo(text2.snp.bottom).offset(11)
            $0.left.equalToSuperview().inset(16)
            $0.width.height.equalTo(91)
        }
        
        text3.snp.makeConstraints{
            $0.top.equalTo(text2.snp.bottom).offset(29)
            $0.left.equalTo(image.snp.right).offset(15)
        }
        
        text4.snp.makeConstraints{
            $0.top.equalTo(text3.snp.bottom).offset(4)
            $0.left.equalTo(image.snp.right).offset(15)
        }
        
        sizeBtn1.snp.makeConstraints{
            $0.top.equalTo(image.snp.bottom).offset(35)
            $0.left.equalToSuperview().inset(15)
        }
        
        sizeBtn2.snp.makeConstraints{
            $0.top.equalTo(image.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
        }
        
        sizeBtn3.snp.makeConstraints{
            $0.top.equalTo(image.snp.bottom).offset(35)
            $0.right.equalToSuperview().inset(15)
        }
        
        sizeBtn4.snp.makeConstraints{
            $0.top.equalTo(sizeBtn1.snp.bottom).offset(8)
            $0.left.equalToSuperview().inset(15)
        }
        
        sizeBtn5.snp.makeConstraints{
            $0.top.equalTo(sizeBtn1.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        CustomtabBar.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(101)
        }
        
        line.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.bottom.equalTo(CustomtabBar.snp.top)
            $0.horizontalEdges.equalToSuperview()
        }
        
        purchaseBtn.snp.makeConstraints{
            $0.top.equalToSuperview().inset(8)
            $0.left.equalToSuperview().inset(16)
            $0.width.equalTo(168)
            $0.height.equalTo(52)
        }
        
        saleBtn.snp.makeConstraints{
            $0.top.equalToSuperview().inset(8)
            $0.right.equalToSuperview().inset(16)
            $0.width.equalTo(168)
            $0.height.equalTo(52)
        }
    }
}
