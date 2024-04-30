//
//  TabBarViewController.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/30/24.
//

//import UIKit
//import Then
//
//class TabBarViewController: UITabBarController {
//
//    // MARK: - UI Components
//    
//    private let tapBar = UITabBar()
//
//    let mainVC = HomeViewController()
//    let toBeReleasedVC = HomeViewController()
//    let searchVC = HomeViewController()
//    let historyVC = HomeViewController()
//
//
//    // MARK: - Life Cycles
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setStyle()
//    }
//
//}
//
//
//// MARK: - Private Methods
//
//private extension TabBarViewController {
//
//    func setStyle() {
//
//        let tabBarAppearance = UITabBarAppearance()
//        tabBarAppearance.backgroundColor = UIColor(resource: .black)
//        self.tabBar.standardAppearance = tabBarAppearance
//        self.tabBar.scrollEdgeAppearance = tabBarAppearance
//        self.selectedIndex = 0
//        self.tabBar.tintColor = UIColor(resource: .white)
//        self.viewControllers = [mainVC, toBeReleasedVC, searchVC, historyVC]
//
//        mainVC.do {
//            $0.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
//        }
//
//        toBeReleasedVC.do {
//            $0.tabBarItem = UITabBarItem(title: "공개예정", image: UIImage(systemName: "play.rectangle.on.rectangle"), selectedImage: UIImage(systemName: "play.rectangle.on.rectangle.fill"))
//        }
//
//        searchVC.do {
//            $0.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
//        }
//
//        historyVC.do {
//            $0.tabBarItem = UITabBarItem(title: "기록", image: UIImage(systemName: "clock.arrow.circlepath"), selectedImage: UIImage(systemName: "clock.arrow.circlepath"))
//
//        }
//    }
//
//}
