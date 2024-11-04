//
//  SAVEDViewController.swift
//  Kream
//
//  Created by KoNangYeon on 10/6/24.
//

import UIKit

class SAVEDViewController: UIViewController {
    
    let data = dummyProductModels.productDates
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
        // Do any additional setup after loading the view.
    }
    
    private lazy var savedView = SavedView().then(){
        $0.tableView.delegate = self
        $0.tableView.dataSource = self
        $0.count.text = "전체 \(data.count)개"
    }
    
}

extension SAVEDViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
}
