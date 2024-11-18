//
//  ViewController.swift
//  Search
//
//  Created by 김호성 on 2024.11.14.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = mainView
        
    }
    
    private lazy var mainView: MainView = {
        let view = MainView()
        view.searchButton.addTarget(self, action: #selector(searchText), for: .touchUpInside)
        return view
    }()
    
    @objc private func searchText() {
         let query = mainView.searchTextField.text ?? ""
         search(query: query)
     }
     
     private func search(query: String) {
         let url = "https://dapi.kakao.com/v2/search/web"
         let parameters: [String: Any] = ["query": query]
         
         APIClient.shared.request(url, method: .get, parameters: parameters) { (result: Result<SearchModel, Error>) in
             switch result {
             case .success(let response):
                 self.updateView(response)
             case .failure(let error):
                 print("네트워킹 오류: \(error)")
             }
             
         }
     }
     
     private func updateView(_ model: SearchModel) {
         mainView.responseTitle.text = model.documents.first?.title
         mainView.responseContentsTitle.text = model.documents.first?.contents
     }
}

