//
//  BaseTabBarController.swift
//  Kream
//
//  Created by 어진 on 10/9/24.
//

import UIKit
import SnapKit

class MyTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .black // 선택된 상태의 색상
        tabBar.unselectedItemTintColor = .gray // 선택되지 않은 상태의 색상
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        let styleVC = StyleViewController()
        styleVC.tabBarItem = UITabBarItem(title: "Style", image: UIImage(systemName: "heart.text.clipboard"), tag: 1)
        
        let shopVC = ShopViewController()
        shopVC.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(systemName: "text.page.badge.magnifyingglass"), tag: 2)
        
        let savedVC = SavedViewController()
        savedVC.tabBarItem = UITabBarItem(title: "Saved", image: UIImage(systemName: "square.and.arrow.down"), tag: 3)
        
        // MyPageViewController를 네비게이션 컨트롤러로 감싸기
        let myPageVC = MyPageViewController()
        let myPageNavController = UINavigationController(rootViewController: myPageVC)
        myPageNavController.tabBarItem = UITabBarItem(title: "My", image: UIImage(systemName: "person.fill"), tag: 4)

        // TabBar에 추가
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myPageNavController]
    }
}
