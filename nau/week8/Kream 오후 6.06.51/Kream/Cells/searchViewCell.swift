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
    
    //이렇게 할 필요없이 컨텐츠뷰로 해도됨 UIView 안넣어도됨!
    lazy var back = UIView().then {
        $0.backgroundColor = UIColor(hexCode: "F6F6F6")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(hexCode: "ECECEC").cgColor
    }
    
    lazy var text = Label(title: "", size: 13.5, weight: .regular)

    
    private func setupView(){
        addSubview(back)
        addSubview(text)
        
        back.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        text.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview().inset(11)
            $0.verticalEdges.equalToSuperview().inset(8)
        }
    }
}
