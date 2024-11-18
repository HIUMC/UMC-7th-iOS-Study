//
//  ViewController.swift
//  project7
//
//  Created by KoNangYeon on 11/15/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = testView
    }
    
    private lazy var testView: APITestView = {
        let view = APITestView()
        view.btn.addTarget(self, action: #selector(searchText), for: .touchUpInside)
        return view
    }()
        
    @objc private func searchText() {
        let query = testView.textField.text ?? ""
        search(query: query)// 전달받은 텍스트를 쿼리로 사용
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
        testView.text2.text = model.documents.first?.title
        testView.text4.text = model.documents.first?.contents
    }
}

