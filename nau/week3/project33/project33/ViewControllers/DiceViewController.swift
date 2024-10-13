//
//  ViewController.swift
//  project33
//
//  Created by KoNangYeon on 10/13/24.
//

import UIKit

class DiceViewController: UIViewController {
    
    let data = dummyDiceModel.diceDatas

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = diceView
    }
        
    private lazy var diceView = DiceView().then() {
        $0.tableView.delegate = self
        $0.tableView.dataSource = self
    }
}

extension DiceViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { data.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DiceCell.identifier, for: indexPath) as? DiceCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
}
