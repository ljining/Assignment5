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
    
    func tabBarUI() {
        
        // 네비게이션 바 숨기기
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.barTintColor = .clear
        tabBar.backgroundColor = .white
        tabBar.tintColor = UIColor.myOrange
        
        let tabBarHeight: CGFloat = 192
        tabBar.frame = CGRect(x: 0, y: view.bounds.height - tabBarHeight, width: 30, height: tabBarHeight)
        
        tabBar.layer.cornerRadius = tabBarHeight / 4
        tabBar.layer.masksToBounds = false
        
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 3, height: 3)
        tabBar.layer.shadowOpacity = 0.1
        tabBar.layer.shadowRadius = 4
    
        
    }
    
    
    func addViewController() {
        
        // 탭 바 컨트롤러에 연결할 뷰 컨트롤러 생성
        let viewController1 = BookmarkPageViewController()
        viewController1.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tab1_icon"), selectedImage: UIImage(named: "tab1_selected"))
        
        let viewController2 = MainPageViewController()
        viewController2.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tab2_icon"), selectedImage: UIImage(named: "tab2_selected"))
        
        let viewController3 = BookInfoPageViewController()
        viewController3.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tab3_icon"), selectedImage: UIImage(named: "tab3_selected"))
        
        // 뷰 컨트롤러를 탭 바 컨트롤러에 추가
        self.viewControllers = [viewController1, viewController2, viewController3]
    }
    
}
