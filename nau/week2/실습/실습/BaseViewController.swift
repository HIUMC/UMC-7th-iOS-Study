//
//  BaseViewController.swift
//  실습
//
//  Created by KoNangYeon on 10/5/24.
//

import UIKit

class BaseViewController: UITabBarController {
    private let modalVC = ModalViewController()
    private let navigationVC = UINavigationController(rootViewController: NavigationViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        modalVC.tabBarItem = UITabBarItem(title: "보관함", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), tag: 0)
        navigationVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 1)

        self.viewControllers = [modalVC, navigationVC]
        
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
