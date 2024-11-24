//
//  SearchHomeView.swift
//  KreamClone
//
//  Created by 이현주 on 11/24/24.
//

import UIKit

class SearchHomeView: UIView {

    public lazy var searchBtn: UIButton = {
        let b = UIButton()
        var configuration = UIButton.Configuration.plain()

        // 타이틀 속성 설정
        let attributes: AttributeContainer = AttributeContainer([
            .font: UIFont.systemFont(ofSize: 13.5, weight: .regular), .foregroundColor: UIColor(hex: "#B6B6B6") ?? .gray])
        configuration.attributedTitle = AttributedString("브랜드, 상품, 프로필, 태그 등", attributes: attributes)
        configuration.titleAlignment = .leading // 제목만 왼쪽 정렬
        
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0) // 여백 설정

        // 버튼 설정
        b.configuration = configuration
        
        b.layer.cornerRadius = 12
        b.contentHorizontalAlignment = .left // 버튼 전체의 내용 정렬을 왼쪽으로 설정
        b.layer.masksToBounds = true
        b.backgroundColor = UIColor(hex: "#F5F5F5")
        return b
    }()
    
    public lazy var cancelBtn: UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14, weight: .medium),
            .foregroundColor: UIColor(hex: "#212121") ?? .black
        ]
        let attributedTitle = NSAttributedString(
            string: "취소",
            attributes: attributes
        )
        b.setAttributedTitle(attributedTitle, for: .normal)
        return b
    }()
    
    public lazy var recomLabel: UILabel = {
        let l = UILabel()
        l.text = "추천 검색어"
        l.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        l.textColor = .black
        return l
    }()
    
    public let recomWordCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.minimumInteritemSpacing = 8
        $0.minimumLineSpacing = 12
    }).then {
        $0.register(RecomWordCollectionViewCell.self, forCellWithReuseIdentifier: RecomWordCollectionViewCell.identifier)
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        self.constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addComponents() {
        [searchBtn, cancelBtn, recomLabel, recomWordCollectionView].forEach{ self.addSubview($0) }
    }
    
    private func constraints() {
        searchBtn.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(6)
            make.leading.equalTo(safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(cancelBtn.snp.leading).offset(-11)
            make.height.equalTo(40)
        }
        
        cancelBtn.snp.makeConstraints { make in
            make.centerY.equalTo(searchBtn)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(22)
        }
        
        recomLabel.snp.makeConstraints { make in
            make.top.equalTo(searchBtn.snp.bottom).offset(41)
            make.leading.equalTo(safeAreaLayoutGuide).offset(16)
        }
        
        recomWordCollectionView.snp.makeConstraints { make in
            make.top.equalTo(recomLabel.snp.bottom).offset(11)
            make.leading.equalTo(safeAreaLayoutGuide).offset(15)
            make.width.equalTo(329)
            make.height.equalTo(76)
        }
    }
}
