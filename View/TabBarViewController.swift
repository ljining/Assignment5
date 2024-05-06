//
//  TabBarViewController.swift
//  BookSearching
//
//  Created by 이유진 on 5/3/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarUI()
        addViewController()
        
        selectedIndex = 1
    }
    
}


extension TabBarViewController {
    
    private func tabBarUI() {
        
        // 네비게이션 바 숨기기
        navigationController?.setNavigationBarHidden(true, animated: true)

        tabBar.barTintColor = .clear
        tabBar.backgroundColor = .white
        tabBar.tintColor = UIColor.myOrange
        
        tabBar.layer.cornerRadius = 50
        
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 3, height: 3)
        tabBar.layer.shadowOpacity = 0.1
        tabBar.layer.shadowRadius = 4
        
    }
    
    
    private func addViewController() {
        
        // 탭 바 컨트롤러에 연결할 뷰 컨트롤러 생성
        let viewController1 = BookmarkPageViewController()
        let tabBarItem1 = UITabBarItem(title: nil, image: UIImage(named: "tap1_icon"), selectedImage: UIImage(named: "tap1_selected"))
        tabBarItem1.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -6, right: 0)
        viewController1.tabBarItem = tabBarItem1
        
        let viewController2 = MainPageViewController()
        let tabBarItem2 = UITabBarItem(title: nil, image: UIImage(named: "tap2_icon"), selectedImage: UIImage(named: "tap2_selected"))
        tabBarItem2.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -6, right: 0)
        viewController2.tabBarItem = tabBarItem2
        
        let viewController3 = BookInfoPageViewController()
        let tabBarItem3 = UITabBarItem(title: nil, image: UIImage(named: "tap3_icon"), selectedImage: UIImage(named: "tap3_selected"))
        tabBarItem3.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -6, right: 0)
        viewController3.tabBarItem = tabBarItem3
        
        // 뷰 컨트롤러를 탭 바 컨트롤러에 추가
        self.viewControllers = [viewController1, viewController2, viewController3]
    }
    
}
