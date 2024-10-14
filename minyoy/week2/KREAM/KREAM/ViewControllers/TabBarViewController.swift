//
//  TabBarViewController.swift
//  KREAM
//
//  Created by 주민영 on 10/8/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    private let homeVC = HomeViewController()
    private let styleVC = StyleViewController()
    private let shopVC = ShopViewController()
    private let savedVC = SavedViewController()
    private let myPageVC = UINavigationController(rootViewController: MyPageViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "icon_home_fill"), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "icon_style_fill"), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "icon_shop_none"), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "_icon_saved_none"), tag: 3)
        myPageVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "icon_my_none"), tag: 4)
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myPageVC]
        self.tabBar.tintColor = .black
    }
}
