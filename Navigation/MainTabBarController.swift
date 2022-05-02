//
//  FirstViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 04.04.2022.
//

import UIKit

//Показывает ленту пользователя
class MainTabBarController: UITabBarController {
    //    Лента пользователя
    let userFeed = FeedViewController()
    //    Профиль пользователя
    let profile = ProfileViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationControllers()
    }
    
    private func setupNavigationControllers() {
        
        let FeedViewController = UINavigationController(rootViewController: userFeed)
        
        userFeed.tabBarItem.title = "Лента пользователя"
        userFeed.tabBarItem.image = UIImage (systemName: "scroll")
        
        let ProfileViewController = UINavigationController(rootViewController: profile)
        profile.tabBarItem.title = "Профиль"
        profile.tabBarItem.image = UIImage (systemName: "person")
        
        
        viewControllers = [FeedViewController, ProfileViewController]
    }
    
}
