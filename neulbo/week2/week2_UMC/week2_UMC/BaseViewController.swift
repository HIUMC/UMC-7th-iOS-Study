//
//  BaseViewController.swift
//  week2_UMC
//
//  Created by 김서현 on 10/2/24.
//

import UIKit

class BaseViewController: UITabBarController {
    private let modalVC = ModalViewController()
    private let navVC = UINavigationController(rootViewController: NavigationViewController())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        // Do any additional setup after loading the view.
        modalVC.tabBarItem = UITabBarItem(title: "Modal", image: UIImage(systemName: "stairs"), tag: 0)
        navVC.tabBarItem = UITabBarItem(title: "Navigation", image: UIImage(systemName: "road.lanes"), tag: 1)
        
        self.viewControllers = [modalVC, navVC]
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
