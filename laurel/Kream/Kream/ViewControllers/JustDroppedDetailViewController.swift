//
//  JustDroppedDetailViewController.swift
//  Kream
//
//  Created by 어진 on 11/18/24.
//

import UIKit
import SnapKit

class JustDroppedDetailViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "matinkim")
        imageView.clipsToBounds = true
        return imageView
    }()

    private let colorOptionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10

        let colorImages = ["matinkim", "matinkim", "matinkim", "matinkim", "matinkim", "matinkim"]
        for imageName in colorImages {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.image = UIImage(named: imageName)
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 5
            imageView.layer.borderWidth = 0
            stackView.addArrangedSubview(imageView)
        }

        return stackView
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .left
        
        let fullText = "즉시 구매가\n228,000원"
        let attributedString = NSMutableAttributedString(string: fullText)
        
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: (fullText as NSString).range(of: "즉시 구매가"))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 20, weight: .bold), range: (fullText as NSString).range(of: "228,000원"))
        
        label.attributedText = attributedString
        return label
    }()

    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Matin Kim Logo Coating Jumper"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()

    private let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "마뗑킴 로고 코팅 점퍼 블랙"
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    private let bookmarkIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bookmark")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let bookmarkLabel: UILabel = {
        let label = UILabel()
        label.text = "2,122"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()

    private lazy var buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 239/255, green: 98/255, blue: 84/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.isUserInteractionEnabled = true // 명시적으로 상호작용 활성화
        button.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)

        // 컨테이너 뷰를 만들어서 레이블들을 담습니다
        let containerView = UIView()
        containerView.isUserInteractionEnabled = false // 컨테이너의 상호작용 비활성화
        button.addSubview(containerView)
        
        let titleLabel = UILabel()
        titleLabel.text = "구매"
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.isUserInteractionEnabled = false // 레이블 상호작용 비활성화

        let priceLabel = UILabel()
        priceLabel.text = "345,000"
        priceLabel.font = UIFont.systemFont(ofSize: 13)
        priceLabel.textColor = .white
        priceLabel.textAlignment = .right
        priceLabel.isUserInteractionEnabled = false // 레이블 상호작용 비활성화

        let subLabel = UILabel()
        subLabel.text = "즉시 구매가"
        subLabel.font = UIFont.systemFont(ofSize: 10)
        subLabel.textColor = UIColor.white.withAlphaComponent(0.8)
        subLabel.textAlignment = .right
        subLabel.isUserInteractionEnabled = false // 레이블 상호작용 비활성화

        let rightStackView = UIStackView(arrangedSubviews: [priceLabel, subLabel])
        rightStackView.axis = .vertical
        rightStackView.alignment = .trailing
        rightStackView.spacing = 4
        rightStackView.isUserInteractionEnabled = false // 스택뷰 상호작용 비활성화

        containerView.addSubview(titleLabel)
        containerView.addSubview(rightStackView)

        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }

        rightStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        return button
    }()

    private lazy var sellButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 65/255, green: 185/255, blue: 122/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true

        let titleLabel = UILabel()
        titleLabel.text = "판매"
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left

        let priceLabel = UILabel()
        priceLabel.text = "345,000"
        priceLabel.font = UIFont.systemFont(ofSize: 13)
        priceLabel.textColor = .white
        priceLabel.textAlignment = .right

        let subLabel = UILabel()
        subLabel.text = "즉시 판매가"
        subLabel.font = UIFont.systemFont(ofSize: 10)
        subLabel.textColor = UIColor.white.withAlphaComponent(0.8)
        subLabel.textAlignment = .right

        let rightStackView = UIStackView(arrangedSubviews: [priceLabel, subLabel])
        rightStackView.axis = .vertical
        rightStackView.alignment = .trailing
        rightStackView.spacing = 4

        button.addSubview(titleLabel)
        button.addSubview(rightStackView)

        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }

        rightStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @objc private func buyButtonTapped() {
        let buyModalVC = BuyModalViewController()
        buyModalVC.modalPresentationStyle = .pageSheet

        if let sheet = buyModalVC.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.prefersGrabberVisible = true 
        }

        present(buyModalVC, animated: true)
    }


    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }

        contentView.addSubview(productImageView)
        contentView.addSubview(colorOptionsStackView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(productDescriptionLabel)
        contentView.addSubview(bookmarkIcon)
        contentView.addSubview(bookmarkLabel)
        contentView.addSubview(buyButton)
        contentView.addSubview(sellButton)

        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview().inset(0)
            make.height.equalTo(374)
        }

        colorOptionsStackView.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(0)
            make.height.equalTo(53)
        }

        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(colorOptionsStackView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
        }

        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }

        productDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }

        bookmarkIcon.snp.makeConstraints { make in
            make.bottom.equalTo(bookmarkLabel.snp.top).offset(-5)
            make.leading.equalToSuperview().offset(30)
            make.width.height.equalTo(20)
        }

        bookmarkLabel.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.leading.equalToSuperview().offset(20)
        }

        buyButton.snp.makeConstraints { make in
            make.centerY.equalTo(bookmarkLabel)
            make.leading.equalTo(bookmarkLabel.snp.trailing).offset(20)
            make.height.equalTo(49)
            make.width.equalTo(147)
        }

        sellButton.snp.makeConstraints { make in
            make.centerY.equalTo(buyButton)
            make.leading.equalTo(buyButton.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(49)
            make.width.equalTo(147)
        }

        // contentView의 높이 제약 추가
        contentView.snp.makeConstraints { make in
            make.bottom.equalTo(buyButton.snp.bottom).offset(20)
        }
    }
}
