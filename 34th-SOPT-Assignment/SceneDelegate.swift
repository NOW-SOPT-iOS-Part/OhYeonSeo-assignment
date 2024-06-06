//
//  SceneDelegate.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/8/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let tabBarVC = UITabBarController()
        let appearance = UITabBarAppearance()
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let releaseVC = UINavigationController(rootViewController: ReleaseViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let historyVC = UINavigationController(rootViewController: HistoryViewController())
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        tabBarVC.setViewControllers([homeVC, releaseVC, searchVC, historyVC], animated: false)
        tabBarVC.tabBar.tintColor = .white
        tabBarVC.tabBar.unselectedItemTintColor = .gray1
        tabBarVC.tabBar.standardAppearance = appearance

        homeVC.title = "홈"
        releaseVC.title = "공개 예정"
        searchVC.title = "검색"
        historyVC.title = "기록"
        
        guard let items = tabBarVC.tabBar.items else { return }
        items[0].image = UIImage(systemName: "house.fill")
        items[1].image = UIImage(systemName: "video")
        items[2].image = UIImage(systemName: "magnifyingglass")
        items[3].image = UIImage(systemName: "clock")
        
        window.rootViewController = tabBarVC
        window.makeKeyAndVisible()
        
        self.window = window
    }
}
