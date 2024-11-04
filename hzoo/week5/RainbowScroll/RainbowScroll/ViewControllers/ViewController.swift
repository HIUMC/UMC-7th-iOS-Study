//
//  ViewController.swift
//  RainbowScroll
//
//  Created by 이현주 on 11/4/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = RainbowView(frame: self.view.bounds)
    }
}

