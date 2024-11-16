//
//  DetailCollectionViewCell.swift
//  KREAM
//
//  Created by 주민영 on 11/9/24.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    static let identifier = "DetailCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var image = UIImageView().then {
        if let originalImage = UIImage(named: "item"),
           let multipliedImage = originalImage.overlay(with: .blue) {
            $0.image = multipliedImage
        }
        
        $0.frame = CGRect(x: 0, y: 0, width: 53, height: 53)
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = UIColor(red: 245/250, green: 245/250, blue: 245/250, alpha: 1)
        $0.layer.borderColor = CGColor(red: 233/250, green: 233/250, blue: 233/250, alpha: 1)
        $0.layer.borderWidth = 1
    }
    
    private func setupView() {
        addSubview(image)
        
        image.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.height.equalTo(53)
        }
    }
}

extension UIImage {
    func overlay(with color: UIColor) -> UIImage? {
        let rect = CGRect(origin: .zero, size: self.size)
                
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        self.draw(in: rect)
        
        context.setBlendMode(.overlay)
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        self.draw(in: rect, blendMode: .destinationIn, alpha: 1.0)
        
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resultImage
    }
}
