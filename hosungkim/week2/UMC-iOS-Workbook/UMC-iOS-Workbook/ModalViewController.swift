//
//  ModalViewController.swift
//  UMC-iOS-Workbook
//
//  Created by 김호성 on 2024.10.03.
//

import UIKit
import SnapKit

class ModalViewController: UIViewController {
    
    private let label = UILabel()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "버튼을 누르면 모달 방식의 화면 전환이 일어나요"
        label.textColor = .cyan
        
        button.setTitle("버튼을 눌러주세요", for: .normal)
        button.backgroundColor = .systemIndigo
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.centerX.equalToSuperview()
        }
        button.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(255)
            $0.height.equalTo(55)
        }
        
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    @objc func buttonDidTap() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .brown
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
}
