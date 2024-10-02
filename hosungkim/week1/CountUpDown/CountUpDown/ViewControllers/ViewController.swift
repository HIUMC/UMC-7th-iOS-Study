//
//  ViewController.swift
//  CountUpDown
//
//  Created by 김호성 on 2024.09.24.
//

import UIKit

class ViewController: UIViewController {
    
    var data: CountUpDownModel = CountUpDownModel(count: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view = counterView
    }
    
    private lazy var counterView: CountUpDownView = {
        let view = CountUpDownView()
        view.countLabel.text = String(data.count)
        view.countDownButton.addTarget(self, action: #selector(decreaseCount), for: .touchUpInside)
        view.countUpButton.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        return view
    }()
    
    @objc func increaseCount() {
        self.data.increaseCount()
        self.updateCount()
    }
    
    @objc func decreaseCount() {
        self.data.decreaseCount()
        self.updateCount()
    }
    
    private func updateCount() {
        self.counterView.countLabel.text = String(data.count)
    }
}

