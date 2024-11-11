//
//  TabBarViewController.swift
//  KREAM
//
//  Created by 주민영 on 10/8/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    private let homeVC = UINavigationController(rootViewController: HomeViewController())
    private let styleVC = StyleViewController()
    private let shopVC = ShopViewController()
    private let savedVC = SavedViewController()
    private let myPageVC = UINavigationController(rootViewController: MyPageViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .white
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = .black
        self.tabBar.scrollEdgeAppearance = tabBarAppearance
        
        self.tabBar.tintColor = .black
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "icon_home"), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "icon_style"), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "icon_shop"), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "icon_saved"), tag: 3)
        myPageVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "icon_my"), tag: 4)
        
        homeVC.tabBarItem.selectedImage = UIImage(named: "icon_home_fill")
        styleVC.tabBarItem.selectedImage = UIImage(named: "icon_style_fill")
        shopVC.tabBarItem.selectedImage = UIImage(named: "icon_shop_fill")
        savedVC.tabBarItem.selectedImage = UIImage(named: "icon_saved_fill")
        myPageVC.tabBarItem.selectedImage = UIImage(named: "icon_my_fill")
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myPageVC]
    }
}
