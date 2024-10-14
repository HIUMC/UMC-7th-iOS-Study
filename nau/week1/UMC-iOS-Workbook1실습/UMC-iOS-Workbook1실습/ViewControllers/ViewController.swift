//
//  ViewController.swift
//  UMC-iOS-Workbook1실습
//
//  Created by KoNangYeon on 9/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    var date: CountUpDownModel = CountUpDownModel(count: 1)//모델 데이터

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = counterView//오류코드해결
    }
    
    private lazy var counterView: CountUpDownView = {
        let view = CountUpDownView()
        view.countLabel.text = String(date.count)//모델데이터를 뷰의 텍스트에 텍스트로 지정
        view.countDownButton.addTarget(self, action: #selector(decreaseCount), for: .touchUpInside)
        view.countUpButton.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        return view
    }()
    
    @objc func increaseCount() {
        self.date.increaseCount()
        self.updateCount()
    }
    @objc func decreaseCount() {
        self.date.decreaseCount()
        self.updateCount()
    }
    
    private func updateCount(){
        self.counterView.countLabel.text = String(date.count)
    }


}

