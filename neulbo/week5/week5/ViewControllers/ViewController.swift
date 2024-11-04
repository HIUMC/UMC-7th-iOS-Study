//
//  ViewController.swift
//  week5
//
//  Created by 김서현 on 11/3/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = RainbowView(frame: self.view.bounds)
    }


}

