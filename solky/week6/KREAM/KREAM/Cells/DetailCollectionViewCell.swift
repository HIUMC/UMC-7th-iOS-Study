//
//  DetailCollectionViewCell.swift
//  KREAM
//
//  Created by 이태림 on 11/11/24.
//

import UIKit
import SnapKit
import Then

class DetailCollectionViewCell: UICollectionViewCell {
    static let identifier = "DetailCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let productcolorview = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00).cgColor
    }
    
    private func setViews() {
        addSubview(productcolorview)
    }
    
    private func setConstraints() {
        
        productcolorview.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
    }
        
    public func detailconfigure(model: DetailModel) {
        self.productcolorview.image = UIImage(named: model.image)
    }
      
}
