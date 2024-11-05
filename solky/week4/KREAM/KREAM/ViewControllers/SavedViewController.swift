//
//  SavedViewController.swift
//  KREAM
//
//  Created by 이태림 on 10/8/24.
//

import UIKit

class SavedViewController: UIViewController {
    
    let data = dummySavedModel.savedDatas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
        dataCount()
    }
    

    private lazy var savedView = SavedView().then {
        $0.tableView.dataSource = self
        $0.tableView.delegate = self
    }
    
    private func dataCount() {
        savedView.dataCount(data.count)
    }
}

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as? SavedCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
}
