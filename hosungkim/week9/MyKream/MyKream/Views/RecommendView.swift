//
//  RecommendView.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.03.
//

import UIKit

class RecommendView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(ivAdvertisement)
        self.addSubview(cvCircle)
        self.addSubview(separatorView)
        self.addSubview(lbProduct)
        self.addSubview(lbSubProduct)
        self.addSubview(cvProduct)
        self.addSubview(separatorView2)
        self.addSubview(lbPhoto)
        self.addSubview(lbSubphoto)
        self.addSubview(cvPhoto)
        
        ivAdvertisement.snp.makeConstraints({
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(336)
        })
        cvCircle.snp.makeConstraints({
            $0.top.equalTo(ivAdvertisement.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(17)
            $0.height.equalTo(182)
        })
        separatorView.snp.makeConstraints({
            $0.top.equalTo(cvCircle.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        })
        lbProduct.snp.makeConstraints({
            $0.top.equalTo(separatorView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(16)
        })
        lbSubProduct.snp.makeConstraints({
            $0.top.equalTo(lbProduct.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(16)
        })
        cvProduct.snp.makeConstraints({
            $0.top.equalTo(lbSubProduct.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(237)
        })
        separatorView2.snp.makeConstraints({
            $0.top.equalTo(cvProduct.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        })
        lbPhoto.snp.makeConstraints({
            $0.top.equalTo(separatorView2.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(16)
        })
        lbSubphoto.snp.makeConstraints({
            $0.top.equalTo(lbPhoto.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(16)
        })
        cvPhoto.snp.makeConstraints({
            $0.top.equalTo(lbSubphoto.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(165)
            $0.bottom.equalToSuperview().inset(30)
        })
    }
    
    public lazy var ivAdvertisement: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image_ad_none.png")
        return imageView
    }()
    public lazy var cvCircle: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .init(width: 61, height: 81)
        layout.minimumInteritemSpacing = 9
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        collectionView.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: CircleCollectionViewCell.identifier)
        
        return collectionView
    }()
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        return view
    }()
    private lazy var lbProduct: UILabel = {
        let label = UILabel()
        label.text = "Just Dropped"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    private lazy var lbSubProduct: UILabel = {
        let label = UILabel()
        label.text = "발매 상품"
        label.textColor = UIColor(red: 135/255, green: 135/255, blue: 135/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    public lazy var cvProduct: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .init(width: 142, height: 237)
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    private lazy var separatorView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        return view
    }()
    private lazy var lbPhoto: UILabel = {
        let label = UILabel()
        label.text = "본격 한파대비! 연말 필수템 모음"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    private lazy var lbSubphoto: UILabel = {
        let label = UILabel()
        label.text = "#해피홀리록챌린지"
        label.textColor = UIColor(red: 135/255, green: 135/255, blue: 135/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    public lazy var cvPhoto: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .init(width: 124, height: 165)
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
}
