//
//  searchCollectionViewCell.swift
//  Kream
//
//  Created by KoNangYeon on 11/20/24.
//

import UIKit

class searchViewCell: UICollectionViewCell {
    
    static let identifier = "searchViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var title = paddingLabel(title: "", size: 13.5, weight: .regular).then {
        $0.backgroundColor = UIColor(hexCode: "F6F6F6")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(hexCode: "ECECEC").cgColor
        $0.textInsets = UIEdgeInsets(top: 7, left: 11, bottom: 7, right: 11)
    }

    private func setupView(){
        addSubview(title)
 
        title.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview()
            $0.verticalEdges.equalToSuperview()
        }
    }
}
