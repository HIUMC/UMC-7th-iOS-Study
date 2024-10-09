//
//  BaseViewController.swift
//  week2Practice
//
//  Created by 이현주 on 10/7/24.
//

import UIKit

class BaseViewController: UITabBarController {
    
    private let modalVC = ModalViewController()
    private let navigationVC = UINavigationController(rootViewController: NavigationViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        modalVC.tabBarItem = UITabBarItem(title: "modalVC", image: UIImage(systemName: "pencil"), tag: 0)
        navigationVC.tabBarItem = UITabBarItem(title: "navigationVC", image: UIImage(systemName: "eraser"), tag: 1)
        
        self.viewControllers = [modalVC, navigationVC]
    }
}
