//
//  TagSearchViewController.swift
//  Kream
//
//  Created by 어진 on 11/25/24.
//

import UIKit

class TagSearchViewController: UIViewController {

    // MARK: - Properties
    private let tagSearchView = TagSearchView()
    private let tags = ["채원 슈프림 후리스", "나이키V2K런", "뉴발란드996", "신상 나이키 콜라보", "허그 FW 패딩", "벨루어 낚시"]

    // MARK: - Lifecycle
    override func loadView() {
        view = tagSearchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupActions()
        setupSearchBar()
    }

    // MARK: - Setup Methods
    private func setupCollectionView() {
        tagSearchView.collectionView.delegate = self
        tagSearchView.collectionView.dataSource = self
        tagSearchView.collectionView.register(TagCell.self, forCellWithReuseIdentifier: "TagCell")
    }

    private func setupActions() {
        tagSearchView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    private func setupSearchBar() {
        tagSearchView.searchBar.delegate = self
    }

    // MARK: - Actions
    @objc private func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension TagSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
        cell.configure(with: tags[indexPath.item])
        return cell
    }
}

// MARK: - TagCell
class TagCell: UICollectionViewCell {
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13.5)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        label.layer.masksToBounds = true
        return label
    }()
    
    private let paddingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1).cgColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(paddingView)
        paddingView.addSubview(label)
        
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            paddingView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            paddingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            paddingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            paddingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            label.topAnchor.constraint(equalTo: paddingView.topAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor, constant: -12),
            label.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        label.text = text
    }
}

// MARK: - UISearchBarDelegate
extension TagSearchViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let clickedTagSearchVC = ClickedTagSearchViewController()
        
        if let navigationController = navigationController {
            navigationController.pushViewController(clickedTagSearchVC, animated: true)
        } else {
            clickedTagSearchVC.modalPresentationStyle = .fullScreen
            present(clickedTagSearchVC, animated: true)
        }
        
        return false
    }
}
