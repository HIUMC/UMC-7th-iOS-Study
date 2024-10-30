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
        
        // 탭 바 아이콘 색상 설정
        tabBar.tintColor = .black // 선택된 상태의 색상
        tabBar.unselectedItemTintColor = .gray // 선택되지 않은 상태의 색상
        
        // 탭 바 위에 선 추가
        let lineView = UIView()
        lineView.backgroundColor = .lightGray
        tabBar.addSubview(lineView)
        
        // SnapKit으로 선 위치 설정
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalTo(tabBar.snp.leading)
            make.trailing.equalTo(tabBar.snp.trailing)
            make.top.equalTo(tabBar.snp.top).offset(-10)
        }
        
        // 탭 바에 추가할 뷰 컨트롤러 설정
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
