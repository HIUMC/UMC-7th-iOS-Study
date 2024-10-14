//
//  MainViewController.swift
//  Kream
//
//  Created by KoNangYeon on 10/6/24.
//

import UIKit

import SnapKit

class MainViewController: UITabBarController {
    private let HOMEVC = HOMEViewController()
    private let STYLEVC = STYLEViewController()
    private let SHOPVC = SHOPViewController()
    private let SAVEDVC = SAVEDViewController()
    private let MYVC = UINavigationController(rootViewController: MYViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let style = UITabBarAppearance()
        style.stackedLayoutAppearance.normal.iconColor = UIColor.black
        
        self.tabBar.tintColor = UIColor.black
        self.tabBar.unselectedItemTintColor = UIColor.gray
        self.tabBar.standardAppearance = style
        
        HOMEVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "icon_home_fill"), tag: 0)
        STYLEVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "Frame 1882"), tag: 1)
        SHOPVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "icon_shop_none"), tag: 2)
        SAVEDVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "_icon_saved_none"), tag: 3)
        MYVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "icon_my_none.png")?.withRenderingMode(.alwaysOriginal), tag: 4)
        
        self.viewControllers = [HOMEVC, STYLEVC, SHOPVC, SAVEDVC, MYVC]
    }

}
