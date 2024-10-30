//
//  SavedTableViewCell.swift
//  Kream
//
//  Created by 어진 on 10/31/24.
//

import UIKit
import SnapKit

class SavedTableViewCell: UITableViewCell {
    
    static let identifier = "SavedTableViewCell"
    
    private lazy var savedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 9)
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.tintColor = .black
        
        button.snp.makeConstraints { make in
            make.width.equalTo(14)
            make.height.equalTo(18)
        }
        
        return button
    }()

    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    // priceLabel과 bookmarkButton을 담을 수직 스택뷰
    private lazy var priceAndBookmarkStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [bookmarkButton, priceLabel])
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.spacing = 13
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(savedImageView)
        contentView.addSubview(textStackView)
        contentView.addSubview(priceAndBookmarkStack) // 수직 스택뷰 추가
        
        // 이미지 뷰 제약 조건 설정
        savedImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(72)
            make.bottom.lessThanOrEqualToSuperview().offset(-20)
        }
        
        // 텍스트 스택뷰 제약 조건 설정
        textStackView.snp.makeConstraints { make in
            make.leading.equalTo(savedImageView.snp.trailing).offset(10)
            make.centerY.equalTo(savedImageView)
            make.trailing.lessThanOrEqualTo(priceAndBookmarkStack.snp.leading).offset(-10)
        }
        
        // priceLabel과 bookmarkButton을 포함한 수직 스택뷰 제약 조건 설정
        priceAndBookmarkStack.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalTo(savedImageView)
        }
    }
    
    func configure(with model: SavedModel) {
        savedImageView.image = UIImage(named: model.savedImage)
        titleLabel.text = model.savedName
        descriptionLabel.text = model.savedDescription
        priceLabel.text = "\(model.savedPrice)원"
    }
}
