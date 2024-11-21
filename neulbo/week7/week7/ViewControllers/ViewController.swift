//
//  ViewController.swift
//  week7
//
//  Created by 김서현 on 11/17/24.
//

import UIKit

class ViewController: UIViewController {

    private lazy var rootView = View().then {
        $0.searchButton.addTarget(self, action: #selector(searchText), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = rootView
    }
    
    @objc private func searchText() {
        let query = rootView.searchTextfield.text ?? "" // textField에서 검색하고자 하는 키워드 가져오기
        search(query: query) // 가져온 검색어로 검색하기
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
    
    // UI 업데이트
    private func updateView(_ model: SearchModel) {
        rootView.titleText.text = model.documents.first?.title
        rootView.contentText.text = model.documents.first?.contents
    }


}



    
    
    

    
    
