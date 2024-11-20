//
//  class.swift
//  Kream
//
//  Created by KoNangYeon on 11/13/24.
//

import Foundation
import UIKit

protocol BtnConfig {
    func config(title: String?, image: UIImage?)
}

protocol layerConfig {
    func configLayer(layerBorderWidth: CGFloat?, layerCornerRadius: CGFloat?, layerColor: UIColor?)
}

protocol LabelConfig {
    func configLabel(text: String?, size: CGFloat, weight: UIFont.Weight, color: UIColor)
}

protocol TextFieldConfig : LabelConfig, layerConfig {
    func configTextField(placeholder: String?, leftView: UIView, leftViewMode: UITextField.ViewMode , interaction: Bool?)
}

class TextField: UITextField, TextFieldConfig {
    func configTextField(placeholder: String?, leftView: UIView, leftViewMode: UITextField.ViewMode, interaction: Bool?) {
        self.placeholder = placeholder
        self.leftView = leftView
        self.leftViewMode = leftViewMode
        self.isUserInteractionEnabled = interaction!
    }
    
    func configLabel(text: String?, size: CGFloat, weight: UIFont.Weight, color: UIColor) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.textColor = color
    }
    
    func configLayer(layerBorderWidth: CGFloat? = 0, layerCornerRadius: CGFloat?, layerColor: UIColor?) {
        self.layer.borderWidth = layerBorderWidth!
        self.layer.cornerRadius = layerCornerRadius!
        self.layer.borderColor = layerColor?.cgColor
    }
}

class BasicButton : UIButton, BtnConfig {
    func config(title: String?, image: UIImage?) {
        self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)
    }
}

class Label: UILabel {
    init(title: String?, size: CGFloat, weight: UIFont.Weight, color: UIColor = UIColor.black){
        super.init(frame: .zero)
        self.text = title
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.textColor = color
        self.textAlignment = .center
        self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomButton2 : UIButton, layerConfig, LabelConfig {
    func configLabel(text: String?, size: CGFloat, weight: UIFont.Weight, color: UIColor) {
        self.setTitle(text, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: size, weight: weight)
    }
    
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

extension UIColor {
    
    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
