//
//  ViewController.swift
//  project3
//
//  Created by KoNangYeon on 10/12/24.
//

import UIKit

import Then

class ViewController: UIViewController {
    
    private let userDefaultsModel = UserDefaultsModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = UserDefaultsview
        loadTextValue()
    }
    
    private lazy var UserDefaultsview = UserDefaultsView().then(){
        $0.saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
    }
    
    @objc func saveButtonClicked() {
        guard let text = UserDefaultsview.inputTextField.text, !text.isEmpty else {
            return
        }
        
        userDefaultsModel.saveUserText(text)
        
        UserDefaultsview.showTextValue.text = text
    }
    
    private func loadTextValue() {
        if let savedText = userDefaultsModel.loadUserText() {
            UserDefaultsview.showTextValue.text = savedText
        }
    }
}

