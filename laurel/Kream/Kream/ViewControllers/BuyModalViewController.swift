//
//  BuyModalViewController.swift
//  Kream
//
//  Created by 어진 on 11/18/24.
//

import UIKit
import SnapKit

class BuyModalViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "구매하기"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "(가격 단위: 원)"
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "matinkim")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Matin Kim Logo Coating Jumper"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "마뗑킴 로고 코팅 점퍼 블랙"
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textAlignment = .left
        label.textColor = .gray
        return label
    }()
    
    private let sizeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var deliveryButtonsStackView: UIStackView = {
        let fastDeliveryButton = createDeliveryButton(title: "345,000", subtitle: "빠른배송(1-2일 소요)", color: UIColor(red: 239/255, green: 98/255, blue: 84/255, alpha: 1))
        let normalDeliveryButton = createDeliveryButton(title: "407,000", subtitle: "일반배송(5-7일 소요)", color: UIColor.black)
        
        let stackView = UIStackView(arrangedSubviews: [fastDeliveryButton, normalDeliveryButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    private func setupView() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(productImageView)
        view.addSubview(productNameLabel)
        view.addSubview(productDescriptionLabel)
        view.addSubview(sizeStackView)
        view.addSubview(deliveryButtonsStackView)
        
        // Title
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView)
            make.leading.equalTo(productImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        productDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(5)
            make.leading.trailing.equalTo(productNameLabel)
        }
        
        // 사이즈 버튼 영역 추가
        let sizeButtons = [("S", "360,000"), ("M", "360,000"), ("L", "360,000"), ("XL", "360,000"), ("XXL", "360,000")]
        let rows = createSizeRows(buttons: sizeButtons)
        for row in rows {
            sizeStackView.addArrangedSubview(row)
        }
        
        sizeStackView.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }

        deliveryButtonsStackView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
    private func createSizeRows(buttons: [(String, String)]) -> [UIStackView] {
        var rows: [UIStackView] = []
        let buttonsPerRow = 3 // 한 줄에 들어갈 버튼 수

        for (index, buttonData) in buttons.enumerated() {
            let (size, price) = buttonData
            let button = createSizeButton(size: size, price: price)

            // 새로운 행 생성
            if index % buttonsPerRow == 0 {
                let row = UIStackView()
                row.axis = .horizontal
                row.alignment = .fill
                row.distribution = .fill // 버튼 크기를 유지하면서 추가
                row.spacing = 10
                rows.append(row)
            }
            rows.last?.addArrangedSubview(button)
        }

        // 마지막 행에 남은 공간을 채워 버튼을 왼쪽 정렬
        if let lastRow = rows.last, lastRow.arrangedSubviews.count < buttonsPerRow {
            let emptyButtonCount = buttonsPerRow - lastRow.arrangedSubviews.count
            for _ in 0..<emptyButtonCount {
                let spacer = UIView() // 빈 공간을 채울 투명한 Spacer 뷰
                lastRow.addArrangedSubview(spacer)
            }
        }

        // 버튼 크기 설정
        for row in rows {
            for view in row.arrangedSubviews {
                if let button = view as? UIButton {
                    button.snp.makeConstraints { make in
                        make.width.equalTo(110) // 버튼 너비
                        make.height.equalTo(47) // 버튼 높이
                    }
                }
            }
        }

        return rows
    }

    private func createSizeButton(size: String, price: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.clipsToBounds = true
        
        let sizeLabel = UILabel()
        sizeLabel.text = size
        sizeLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        sizeLabel.textColor = .black
        sizeLabel.textAlignment = .center
        
        let priceLabel = UILabel()
        priceLabel.text = price
        priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        priceLabel.textColor = UIColor(red: 239/255, green: 98/255, blue: 84/255, alpha: 1)
        priceLabel.textAlignment = .center
        
        let stackView = UIStackView(arrangedSubviews: [sizeLabel, priceLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        
        button.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        return button
    }
    
    private func createDeliveryButton(title: String, subtitle: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.backgroundColor = color
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        subtitleLabel.textColor = UIColor.white.withAlphaComponent(0.8)
        subtitleLabel.textAlignment = .center
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        
        button.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        return button
    }
}
