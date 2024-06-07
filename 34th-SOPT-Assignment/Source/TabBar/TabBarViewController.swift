//
//  TabBarViewController.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 6/7/24.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let releaseVC = UINavigationController(rootViewController: ReleaseViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let historyVC = UINavigationController(rootViewController: HistoryViewController())
        
        homeVC.title = "홈"
        releaseVC.title = "공개 예정"
        searchVC.title = "검색"
        historyVC.title = "기록"
        
        self.setViewControllers([homeVC, releaseVC, searchVC, historyVC], animated: false)
        
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.standardAppearance = appearance
        
        guard let items = self.tabBar.items else { return }
        items[0].image = UIImage(systemName: "house.fill")
        items[1].image = UIImage(systemName: "video")
        items[2].image = UIImage(systemName: "magnifyingglass")
        items[3].image = UIImage(systemName: "clock")
    }
}
