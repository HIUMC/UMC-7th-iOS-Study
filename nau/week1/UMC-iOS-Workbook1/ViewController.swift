//
//  ViewController.swift
//  UMC-iOS-Workbook1
//
//  Created by KoNangYeon on 9/29/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    private lazy var button: UIButton = {
        let btn = UIButton()
        btn.setTitle("UIButton 입니다.",for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()


}

