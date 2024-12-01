//
//  detailedSearchViewController.swift
//  Kream
//
//  Created by KoNangYeon on 11/21/24.
//

import UIKit
import Then
import Moya

class detailedSearchViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = searchView1
        
        if let searchBar = searchView1.searchStack.arrangedSubviews[1] as? UITextField {
            searchBar.delegate = self
        }
    }

    private lazy var searchView1 = detailedSearchView().then {
        $0.tableView.delegate = self
        $0.tableView.dataSource = self
        
        $0.backBtn.addTarget(self, action: #selector(backBtnDidTap), for: .touchUpInside)
        if let btn = $0.searchStack.arrangedSubviews[2] as? UIButton {
            btn.addTarget(self, action: #selector(backbtnDidTap), for: .touchUpInside)
        }
    }
    
    @objc
    private func backBtnDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func backbtnDidTap() {
        // 현재 화면에서 네비게이션 스택 닫기
        if let navigationController = self.navigationController {
            navigationController.popToRootViewController(animated: false)
            navigationController.dismiss(animated: false)
        } else {
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let text = textField.text, !text.isEmpty {
            getSearchInfr(query: text)
            searchView1.line.isHidden = true // 테이블뷰 나올땐 라인이 없길래..
        }
        
        return true
    }
    
    //네트워크 요청을 수행할 객체
    private let provider = MoyaProvider<searchTargetType>()
    
    //title값 배열에 저장
    var productTitles: [String] = []
    
    private func getSearchInfr(query: String) {
        provider.request(.product(query: query)) { result in
            switch result {
            case .success(let response):
                do {
                    let searchResponse = try response.map(searchResponseModel.self)
                    self.productTitles = searchResponse.products.map {$0.title}
                    
                    DispatchQueue.main.async {
                        self.searchView1.tableView.reloadData()
                    }
                } catch {
                    print("Mapping error: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Network request error: \(error.localizedDescription)")
            }
        }
    }
    
}

extension detailedSearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.productTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: detailedSearchViewCell.identifier, for: indexPath) as? detailedSearchViewCell else {
            return UITableViewCell()
        }
        
        cell.title.text = productTitles[indexPath.row]
        
        return cell
    }
}
    

