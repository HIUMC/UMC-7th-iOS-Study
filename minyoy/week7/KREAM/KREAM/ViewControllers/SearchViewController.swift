//
//  SearchViewController.swift
//  KREAM
//
//  Created by 주민영 on 10/29/24.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view = searchView
    }
    
    private lazy var searchView: SearchView = {
        let view = SearchView()
        view.cancelButton.addTarget(self, action: #selector(btnDidup), for: .touchUpInside)
        return view
    }()
    
    @objc private func btnDidup() {
        self.navigationController?.popViewController(animated: false)
    }
}
