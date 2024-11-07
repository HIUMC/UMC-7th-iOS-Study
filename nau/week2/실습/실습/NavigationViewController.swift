//
//  NavigationViewController.swift
//  실습
//
//  Created by KoNangYeon on 10/5/24.
//

import UIKit

class NavigationViewController: UIViewController {
    private let label = UILabel()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "버튼 누르면 네비게이션 방식의 화면 전환이 일어남"
        label.textColor = .orange
        
        button.setTitle("버튼을 눌러주세요!", for: .normal)
        button.backgroundColor = .brown
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints{
            $0.top.equalToSuperview().offset(80)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints{
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
        }
        
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func buttonDidTap() {
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .magenta
        
        navigationController?.pushViewController(viewController, animated: true)
    }

    
    
}
