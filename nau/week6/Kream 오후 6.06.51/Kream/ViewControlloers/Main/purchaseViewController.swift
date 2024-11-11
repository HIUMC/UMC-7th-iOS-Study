//
//  File 2.swift
//  Kream
//
//  Created by KoNangYeon on 11/10/24.
//

import UIKit

class purchaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = purchaseView1
        
    }
    
    private lazy var purchaseView1 = purchaseView().then {
        $0.backBtn.addTarget(self, action: #selector(backBtnDidTap), for: .touchUpInside)
        for button in $0.buttons {
            button.addTarget(self, action: #selector(sizeBtnDidTap), for: .touchUpInside)
        }
    }
    
    @objc
    private func backBtnDidTap() {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @objc
    private func sizeBtnDidTap(_ sender: UIButton){
        for button in purchaseView1.buttons {
            button.layer.borderColor = UIColor(hue: 0, saturation: 0, brightness: 0.94, alpha: 1.0).cgColor
        }
        
        sender.layer.borderColor = UIColor.black.cgColor
    }
}
