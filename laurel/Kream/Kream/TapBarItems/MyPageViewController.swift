//
//  MyPageViewController.swift
//  Kream
//
//  Created by 어진 on 10/9/24.
//

import UIKit

class MyPageViewController: UIViewController {
    
    override func loadView() {
        self.view = MyPageView() // MyPageView를 view로 설정
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
