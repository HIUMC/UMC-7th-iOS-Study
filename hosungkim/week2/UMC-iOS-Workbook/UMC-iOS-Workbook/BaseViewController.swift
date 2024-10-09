//
//  BaseViewController.swift
//  UMC-iOS-Workbook
//
//  Created by 김호성 on 2024.10.03.
//

import UIKit

class BaseViewController: UITabBarController {
    
    private let modalVC: ModalViewController = ModalViewController()
    private let navigationVC = UINavigationController(rootViewController: NavigationViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        modalVC.tabBarItem = UITabBarItem(title: "modalVC", image: UIImage(systemName: "apple.terminal"), tag: 0)
        navigationVC.tabBarItem = UITabBarItem(title: "navigationVC", image: UIImage(systemName: "tray.full"), tag: 1)
        self.viewControllers = [modalVC, navigationVC]
    }
}
