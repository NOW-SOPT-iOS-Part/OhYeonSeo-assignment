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
        self.window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: HomeViewController())
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
