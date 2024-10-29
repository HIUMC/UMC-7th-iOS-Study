//
//  MainViewController.swift
//  KREAM
//
//  Created by 이태림 on 10/8/24.
//

import UIKit

import SnapKit

import Then

class MainViewController: UITabBarController {
    private let homeVC = HomeViewController()
    private let mypageVC = UINavigationController(rootViewController: MypageViewController())
    private let savedVC = SavedViewController()
    private let shopVC = ShopViewController()
    private let styleVC = StyleViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "icon_home_fill"), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "icon_style_fill"), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "icon_shop_none"), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "_icon_saved_none"), tag: 3)
        mypageVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "Union"), tag: 4)
        
        UITabBar.appearance().tintColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, mypageVC]
        
                                                                        
    }
    
    
    

}
