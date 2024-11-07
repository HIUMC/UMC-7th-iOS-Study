//
//  BaseViewController.swift
//  cloneKream
//
//  Created by 김서현 on 10/2/24.
//

import UIKit
import SnapKit

class BaseViewController: UITabBarController {
    private let homeVC = UINavigationController(rootViewController: HomeViewController()) 
    private let styleVC = StyleViewController()
    private let shopVC = ShopViewController()
    private let savedVC = SavedViewController()
    private let myViewVC = UINavigationController(rootViewController: MyViewController())
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customTabBar = CustomTabBar()
        self.setValue(customTabBar, forKey: "tabBar")
        
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "home")?.withRenderingMode(.alwaysOriginal), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "style"), tag: 0)
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "home"), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "shop"), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "saved"), tag: 3)
        myViewVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "myView"), tag: 4)

        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myViewVC]
        
        tabBar.barTintColor = .white
        tabBar.tintColor = UIColor.black // 선택된 아이템의 색상을 검정색으로 설정
        tabBar.layer.borderColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1).cgColor
        tabBar.layer.borderWidth = 2
    }
    

    private func setTabBarImage() {
        
    }

}


import UIKit

class CustomTabBar: UITabBar {

    // 원하는 높이를 설정 (80으로 설정)
    let customHeight: CGFloat = 110

    // 이 메서드를 오버라이드해서 탭 바의 크기를 재정의
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = customHeight // 원하는 높이로 설정
        return sizeThatFits
    }

    // 탭 바의 위치와 크기를 재정의하기 위해 layoutSubviews 오버라이드
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 탭 바의 frame을 재설정
        var tabFrame = self.frame
        tabFrame.size.height = customHeight // 높이 조정
        tabFrame.origin.y = self.superview!.frame.height - customHeight // 탭 바를 화면 하단에 배치
        self.frame = tabFrame
    }
}

