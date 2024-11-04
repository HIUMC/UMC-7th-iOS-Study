//
//  ViewController.swift
//  Rainbow
//
//  Created by 김호성 on 2024.11.03.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = rainbowView
        
    }
    private lazy var rainbowView: RainbowView = {
        let rainbowView = RainbowView(frame: self.view.bounds)
        
        return rainbowView
    }()
    
}

