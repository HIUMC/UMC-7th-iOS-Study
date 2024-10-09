//
//  NavigationViewController.swift
//  week2Practice
//
//  Created by 이현주 on 10/7/24.
//

import UIKit

class NavigationViewController: UIViewController {

    private let label = UILabel()
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "버튼을 누르면 네비게이션 방식의 화면 전환이 일어나요"
        label.textColor = .yellow

        button.setTitle("버튼을 눌러주세요", for: .normal)
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc
    private func buttonTapped() {
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .lightGray
        
        navigationController?.pushViewController(viewController, animated: true)
    }}
