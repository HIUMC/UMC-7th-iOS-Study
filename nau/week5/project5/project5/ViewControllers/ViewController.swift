//
//  ViewController.swift
//  project5
//
//  Created by KoNangYeon on 11/2/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = RainbowView(frame: self.view.bounds)
    }


}

