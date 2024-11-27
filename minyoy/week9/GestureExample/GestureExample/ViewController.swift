//
//  ViewController.swift
//  GestureExample
//
//  Created by 주민영 on 11/27/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = gestureView
    }
    
    private lazy var gestureView: GestureImageView = {
        let view = GestureImageView()
        view.loadImage(from: "https://i.namu.wiki/i/4NF1IKufwxLaaFg14oH-yYnQs_fvYNNVQXVBQwePB4mSWVvoYDpizxopSUnxX0dC7MdGzRMqlTs3qcjm9gWC4YzHUptoBPQavR1WGcuSGpn0QgMXSeLqZrFL0YvsRZy_9MC_b0yQVyicfGT6jDdsdw.webp")
        return view
    }()
}

