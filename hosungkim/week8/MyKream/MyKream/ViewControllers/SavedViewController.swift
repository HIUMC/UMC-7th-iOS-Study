//
//  SavedViewController.swift
//  MyKream
//
//  Created by 김호성 on 2024.10.04.
//

import UIKit

class SavedViewController: UIViewController {
    
    private let data = DummySavedModel.savedDatas

    override func viewDidLoad() {
        super.viewDidLoad()
        print("SavedViewController")
        self.view = savedView
    }
    
    private lazy var savedView: SavedView = {
        let view = SavedView()
        view.tableView.dataSource = self
        view.tableView.delegate = self
        return view
    }()
}

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedTableViewCell.identifier, for: indexPath) as? SavedTableViewCell else { return UITableViewCell() }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
}
