//
//  RainbowViewController.swift
//  RainBow_5st
//
//  Created by 주민영 on 11/4/24.
//

import UIKit

class RainbowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = RainbowView(frame: self.view.bounds)
    }
}
