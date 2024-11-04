//
//  SavedViewController.swift
//  cloneKream
//
//  Created by 김서현 on 10/2/24.
//

import UIKit

class SavedViewController: UIViewController {
    
    let data = SavedModel.dummy()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
    }
    
    
    private lazy var savedView = SavedView().then {
        $0.tableView.dataSource = self
        $0.tableView.delegate = self
    }

}

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedTableViewCell.identifier, for: indexPath) as? SavedTableViewCell else { return UITableViewCell() }
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
    
}
