//
//  ModalViewController.swift
//  week2 실습
//
//  Created by 이태림 on 10/6/24.
//

import UIKit

import SnapKit

class ModalViewController: UIViewController {
    private let label = UILabel()
    private lazy var btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "버튼을 누르면 모달 방식의 화면 전환이 일어나요!"
        label.textColor = .black
        
        btn.setTitle("버튼을 눌러주세요", for: .normal)
        btn.backgroundColor = .systemBlue
        
        view.addSubview(label)
        view.addSubview(btn)
        
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(400)
            $0.centerX.equalToSuperview()
        }
        
        btn.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        btn.addTarget(self, action: #selector(btndidTap), for: .touchUpInside)
        
    }
    
    @objc
    private func btndidTap() {
        let viewcontroller = UIViewController()
        
        viewcontroller.view.backgroundColor = .magenta
        viewcontroller.modalPresentationStyle = .fullScreen
        
        present(viewcontroller, animated: true)
    }
    
}
    


