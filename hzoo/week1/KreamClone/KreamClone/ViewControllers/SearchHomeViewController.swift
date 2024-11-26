//
//  SearchHomeViewController.swift
//  KreamClone
//
//  Created by 이현주 on 11/24/24.
//

import UIKit

class SearchHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchHomeView
    }

    public lazy var searchHomeView: SearchHomeView = {
        let v = SearchHomeView()
        
        v.cancelBtn.addTarget(self, action: #selector(cancelBtnTapped), for: .touchUpInside)
        v.searchBtn.addTarget(self, action: #selector(searchBtnTapped), for: .touchUpInside)
        
        v.recomWordCollectionView.delegate = self
        v.recomWordCollectionView.dataSource = self
        
        return v
    }()
    
    @objc
    private func cancelBtnTapped() {
        self.dismiss(animated: true)
    }
    
    @objc
    private func searchBtnTapped() {
        let vc = SearchDetailViewController()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
}

extension SearchHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RecomWordModel.list().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecomWordCollectionViewCell.identifier, for: indexPath) as! RecomWordCollectionViewCell
        let list = RecomWordModel.list()
        
        cell.searchWord.text = list[indexPath.row].word
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let title = RecomWordModel.list()[indexPath.row].word
        let font = UIFont.systemFont(ofSize: 13.5, weight: .regular)
        let size = title.size(withAttributes: [.font: font])
        
        let padding: CGFloat = 22
        let cellWidth = size.width + padding
        
        return CGSize(width: cellWidth, height: 32)
    }
}
