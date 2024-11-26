//
//  RecommenedViewController.swift
//  cloneKream
//
//  Created by 김서현 on 11/25/24.
//

import UIKit

class RecommenedViewController: UIViewController, UISearchBarDelegate {
    
    private let rootView = RecommenedSearchView()
    
    private lazy var searchController = UISearchController(searchResultsController: nil).then {
        $0.searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.searchBar.setImage(UIImage(), for: .search, state: .normal)
        $0.hidesNavigationBarDuringPresentation = false
        $0.definesPresentationContext = true
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(rootView)
        
        setSearchController()
        
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
        
        rootView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        print("Search Controller 초기화 상태: \(searchController)")
    }
    
    
    
    private func setSearchController() {
        self.navigationItem.titleView = searchController.searchBar
        searchController.hidesNavigationBarDuringPresentation = false
        self.navigationItem.hidesBackButton = true
        
        searchController.searchBar.delegate = self
        
        let cancelBarButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonTapped))
        self.navigationItem.rightBarButtonItem  = cancelBarButton
        navigationController?.navigationBar.tintColor = .black
        
        // 백 버튼 텍스트를 빈 문자열로 설정 - 표시할 화면 이전 화면에서 설정해야 함.
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem

    }
    
    @objc private func cancelButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let userSearchViewController = UserSearchViewController()
        navigationController?.pushViewController(userSearchViewController, animated: true)
        return true
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RecommenedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SearchedModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchedCollectionViewCell.identifier, for: indexPath) as? SearchedCollectionViewCell else { return UICollectionViewCell() }
        let list = SearchedModel.dummy()
        cell.title.text = list[indexPath.row].keyword
        return cell
    }
    
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchedCollectionViewCell.identifier, for: indexPath) as? SearchedCollectionViewCell else {
                    return .zero
                }
        cell.title.text = SearchedModel.dummy()[indexPath.row].keyword
        // ✅ sizeToFit() : 텍스트에 맞게 사이즈가 조절
        cell.title.sizeToFit()

        // ✅ cellWidth = 글자수에 맞는 UILabel 의 width + 20(여백)
        let cellWidth = cell.title.frame.width + 20

        return CGSize(width: cellWidth, height: 32)
    }*/
    
    
}
