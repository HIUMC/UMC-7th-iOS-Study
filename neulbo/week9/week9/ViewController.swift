//
//  ViewController.swift
//  week9
//
//  Created by 김서현 on 11/26/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var gestureView = GestureImageView().then {
        $0.loadImage(from: "https://live.staticflickr.com/65535/51734305911_f4541d7629_m.jpg")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = gestureView
    }


}

