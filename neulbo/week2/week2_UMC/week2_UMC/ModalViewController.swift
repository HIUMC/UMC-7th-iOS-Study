//
//  ModalViewController.swift
//  week2_UMC
//
//  Created by 김서현 on 10/2/24.
//

import UIKit
import SnapKit

class ModalViewController: UIViewController {
    private let label = UILabel()
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        label.text = "버튼을 누르면 모달 방식의 화면 전환이 일어나요"
        label.textColor = .darkGray
        
        button.setTitle("버튼을 눌러주세요", for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(button).offset(-40)
        }
        
        button.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
    }
    
    @objc private func buttonDidTap() {
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .systemPink
        viewController.view.alpha = 0.5
        viewController.modalPresentationStyle = .overFullScreen
        
        present(viewController, animated: true)
    }

}
