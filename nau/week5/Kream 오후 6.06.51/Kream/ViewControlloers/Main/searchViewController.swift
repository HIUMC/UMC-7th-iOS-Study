//
//  searchViewController.swift
//  Kream
//
//  Created by KoNangYeon on 11/3/24.
//

import UIKit
import Then

class searchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchView1
        
    }
    
    private lazy var searchView1 = searchView().then { _ in }

}
