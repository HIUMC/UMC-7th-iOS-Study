//
//  SavedViewController.swift
//  KreamClone
//
//  Created by 이현주 on 10/7/24.
//

import UIKit

class SavedViewController: UIViewController {
    
    let data = dummySavedModel.savedDatas

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view = savedView
    }
    
    private lazy var savedView: SavedView = {
        let s = SavedView()
        s.total = data.count
        s.savedTableView.dataSource = self
        s.savedTableView.dataSource = self
        return s
    }()
}

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SavedTableViewCell", for: indexPath) as? SavedTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
}

