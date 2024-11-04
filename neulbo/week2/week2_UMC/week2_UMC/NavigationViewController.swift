//
//  NavigationViewController.swift
//  week2_UMC
//
//  Created by 김서현 on 10/2/24.
//

import UIKit

class NavigationViewController: UIViewController {
    private let label = UILabel()
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "여기는 Navigation ViewController입니다. 버튼을 눌러 보세요."
        label.textColor = .darkGray
        label.numberOfLines = 0
        
        button.setTitle("버튼을 눌러 주세요", for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints {
            //$0.centerX.equalToSuperview()
            $0.top.equalTo(button).offset(-40)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        button.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    
    @objc private func buttonDidTap() {
        let viewcontroller = UIViewController()
        
        viewcontroller.view.backgroundColor = .cyan
        
        navigationController?.pushViewController(viewcontroller, animated: true)
        
    }
    

}
