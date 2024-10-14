//
//  ViewController.swift
//  UserDefaults
//
//  Created by 김호성 on 2024.10.13.
//

import UIKit

class ViewController: UIViewController {
    
    private let userDefaultsModel: UserDefaultsModel = UserDefaultsModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = userDefaultsView
        loadTextValue()
    }
    
    private lazy var userDefaultsView: UserDefaultsView = {
        let view = UserDefaultsView()
        view.saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
       
        return view
    }()
    
    @objc func saveButtonClicked() {
        guard let text = userDefaultsView.inputTextField.text, !text.isEmpty else { return }
        
        userDefaultsModel.saveUserText(text)
        userDefaultsView.showTextValue.text = text
    }
    
    private func loadTextValue() {
        if let savedText = userDefaultsModel.loadUserText() {
            userDefaultsView.showTextValue.text = savedText
        }
    }
}

