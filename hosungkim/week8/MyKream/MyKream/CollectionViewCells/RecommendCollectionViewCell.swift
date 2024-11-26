//
//  RecommendCollectionViewCell.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.20.
//

import UIKit
import SnapKit

class RecommendCollectionViewCell: UICollectionViewCell {
    static let identifier: String = String(describing: ProductCollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(roundView)
        self.addSubview(lbMain)
        
        roundView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
        lbMain.snp.makeConstraints({
            $0.top.bottom.equalToSuperview().inset(8)
            $0.leading.trailing.equalToSuperview().inset(11)
        })
    }
    
    public lazy var roundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        view.layer.borderColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 20
        return view
    }()
    public lazy var lbMain: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.5)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
}
