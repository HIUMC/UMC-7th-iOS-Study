//
//  SizeCollectionViewCell.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.10.
//

import UIKit
import SnapKit

class SizeCollectionViewCell: UICollectionViewCell {
    static let identifier: String = String(describing: ImageCollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var frameView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        return view
    }()
    public lazy var lbSize: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    public lazy var lbPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 217/255, green: 90/255, blue: 93/255, alpha: 1)
        return label
    }()
    
    private func setupView() {
        self.addSubview(frameView)
        frameView.addSubview(lbSize)
        frameView.addSubview(lbPrice)
        
        frameView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
        lbSize.snp.makeConstraints({
            $0.top.equalToSuperview().inset(8)
            $0.centerX.equalToSuperview()
        })
        lbPrice.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
        })
    }
    
    func applySelectedStyle(selected: Bool) {
        switch selected {
        case true:
            frameView.layer.borderColor = UIColor.black.cgColor
            lbSize.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            lbPrice.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        case false:
            frameView.layer.borderColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1).cgColor
            lbSize.font = UIFont.systemFont(ofSize: 14)
            lbPrice.font = UIFont.systemFont(ofSize: 12)
        }
    }
}
