//
//  ViewController.swift
//  week1Practice
//
//  Created by 이현주 on 10/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    var data: CountUpDownModel = CountUpDownModel(count: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = counterView
    }
    
    private lazy var counterView: CountUpDownView = {
        let v = CountUpDownView()
        v.countLabel.text = String(data.count)
        v.countDownButton.addTarget(self, action: #selector(decreaseCount), for: .touchUpInside)
        v.countUpButton.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        return v
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

