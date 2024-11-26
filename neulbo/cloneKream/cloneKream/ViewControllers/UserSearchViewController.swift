//
//  UserSearchViewController.swift
//  cloneKream
//
//  Created by 김서현 on 11/25/24.
//

import UIKit
import Moya

class UserSearchViewController: UIViewController, UISearchBarDelegate {
    
    private let rootView = UserSearchView()
    private let provider = MoyaProvider<SearchResultType>()
    
    private lazy var searchController = UISearchController(searchResultsController: nil).then {
        $0.searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.searchBar.setImage(UIImage(), for: .search, state: .normal)
        $0.hidesNavigationBarDuringPresentation = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(rootView)
        
        setSearchController()
        
        rootView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        

    }

   
    
    private func setSearchController() {
        //self.navigationItem.titleView = searchController.searchBar
        self.navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = false
        self.navigationItem.hidesBackButton = false
        
        searchController.searchBar.delegate = self
        self.definesPresentationContext = true
        
        let cancelBarButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonTapped))
        self.navigationItem.rightBarButtonItem  = cancelBarButton
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc private func cancelButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print("shouldbegin")

        return true
    }

    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("textbeginEdit")
    }
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            print("검색어가 없습니다.")
            return
        }

        print("사용자가 검색 버튼을 클릭했습니다: \(searchText)")
        provider.request(.getSearchResults(keyword: searchText)) { result in
            switch result {
            case .success(let response):
                do {
                  print(String(data: response.data, encoding: .utf8) ?? "Invalid JSON")

                  let userResponse = try response.map(SearchResultModel.self)
                  print("Successfully mapped response: \(userResponse)")

                } catch {
                  print("Mapping error: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Network request error: \(error.localizedDescription)")
            }
        }
    }



}


