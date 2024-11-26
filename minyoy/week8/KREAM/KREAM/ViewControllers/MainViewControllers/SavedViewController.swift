//
//  SavedViewController.swift
//  KREAM
//
//  Created by 주민영 on 10/8/24.
//

import UIKit

class SavedViewController: UIViewController {
    
    let data = dummyProductModel.productDatas

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
    }
    
    private lazy var savedView: SavedView = {
        let view = SavedView()
        view.tableView.dataSource = self
        view.productNumberLabel.text = "전체 \(data.count)개"
        return view
    }()
}

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        return cell
    }
}
