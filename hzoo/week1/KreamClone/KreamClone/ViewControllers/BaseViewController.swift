//
//  BaseViewController.swift
//  KreamClone
//
//  Created by 이현주 on 10/7/24.
//

import UIKit

class BaseViewController: UITabBarController {
    
    private let HomeVC = HomeViewController()
    private let StyleVC = StyleViewController()
    private let ShopVC = ShopViewController()
    private let SavedVC = SavedViewController()
    private let MyPageVC = UINavigationController(rootViewController: MyPageViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
 
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = UIColor(hex: "#A2A2A2")

        HomeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "home")?.withRenderingMode(.alwaysOriginal), tag: 0)
        HomeVC.tabBarItem.selectedImage = UIImage(named: "home_fill")?.withRenderingMode(.alwaysOriginal)
        
        StyleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "style")?.withRenderingMode(.alwaysOriginal), tag: 1)
        
        ShopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "shop")?.withRenderingMode(.alwaysOriginal), tag: 2)
        
        SavedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "saved")?.withRenderingMode(.alwaysOriginal), tag: 3)
        SavedVC.tabBarItem.selectedImage = UIImage(named: "saved_fill")?.withRenderingMode(.alwaysOriginal)
        
        MyPageVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "mypage")?.withRenderingMode(.alwaysOriginal), tag: 4)
        MyPageVC.tabBarItem.selectedImage = UIImage(named: "mypage_fill")?.withRenderingMode(.alwaysOriginal)
        
        viewControllers = [HomeVC, StyleVC, ShopVC, SavedVC, MyPageVC]
        
    }
}
