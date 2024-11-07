//
//  SearchViewController.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.01.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchView

        // Do any additional setup after loading the view.
    }
    private lazy var searchView: SearchView = {
        let searchView = SearchView()
        return searchView
    }()
}
