//
//  SearchViewController.swift
//  KREAM
//
//  Created by 이태림 on 10/31/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    private lazy var searchview = SearchView().then {
        $0.backgroundColor = .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchview
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
