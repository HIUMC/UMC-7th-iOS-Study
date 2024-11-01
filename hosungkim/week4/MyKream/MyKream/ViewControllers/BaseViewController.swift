//
//  BaseViewController.swift
//  MyKream
//
//  Created by 김호성 on 2024.10.03.
//

import UIKit

class BaseViewController: UITabBarController {
    
    private let homeViewController = UINavigationController(rootViewController: HomeViewController())
    private let styleViewController = StyleViewController()
    private let shopViewController = ShopViewController()
    private let savedViewController = SavedViewController()
    private let myPageViewController = UINavigationController(rootViewController: MyPageViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.viewControllers = [
            homeViewController,
            styleViewController,
            shopViewController,
            savedViewController,
            myPageViewController,
        ]
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .white
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = .black
        self.tabBar.scrollEdgeAppearance = tabBarAppearance
        
        self.tabBar.tintColor = .black
        
        homeViewController.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "icon_home"), tag: 0)
        styleViewController.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "icon_style"), tag: 1)
        shopViewController.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "icon_shop"), tag: 2)
        savedViewController.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "icon_saved"), tag: 3)
        myPageViewController.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "icon_my"), tag: 4)
        
        homeViewController.tabBarItem.selectedImage = UIImage(named: "icon_home_fill")
        styleViewController.tabBarItem.selectedImage = UIImage(named: "icon_style_fill")
        shopViewController.tabBarItem.selectedImage = UIImage(named: "icon_shop_fill")
        savedViewController.tabBarItem.selectedImage = UIImage(named: "icon_saved_fill")
        myPageViewController.tabBarItem.selectedImage = UIImage(named: "icon_my_fill")
        
        self.selectedIndex = 4
    }
    
}
