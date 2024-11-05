//
//  ViewController.swift
//  week5 실습
//
//  Created by 이태림 on 11/4/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = RainbowView(frame: self.view.bounds)
    }
}


