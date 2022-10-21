//
//  CustomTabBarController.swift
//  Crysha-MVC
//
//  Created by Виктор on 20.10.2022.
//

import UIKit

class CustomTabBarController: UITabBarController {
    func configureTabBarController() {
        let krishaKzViewController = ViewController()
        krishaKzViewController.tabBarItem = CustomTabBarItem(title: "Krisha.kz",
                                                             image: UIImage(systemName: "house.circle.fill"),
                                                             tag: 0,
                                                             normalColor: .gray,
                                                             selectedColor: .black)
        
        let favoritesViewController = FavoritesViewController()
        favoritesViewController.tabBarItem = CustomTabBarItem(title: "Избранное",
                                                             image: UIImage(systemName: "heart"),
                                                             tag: 1,
                                                             normalColor: .gray,
                                                             selectedColor: .black)
        
        let applyViewController = ApplyViewController()
        applyViewController.tabBarItem = CustomTabBarItem(title: "Подать",
                                                             image: UIImage(systemName: "plus.rectangle.fill"),
                                                             tag: 2,
                                                             normalColor: .blue,
                                                             selectedColor: .black)
        applyViewController.tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: -2)
        let messagesViewController = MessagesViewController()
        messagesViewController.tabBarItem = CustomTabBarItem(title: "Cообщения",
                                                             image: UIImage(systemName: "envelope"),
                                                             tag: 3,
                                                             normalColor: .gray,
                                                             selectedColor: .black)

        
        let accountViewController = AccountViewController()
        accountViewController.tabBarItem = CustomTabBarItem(title: "Кабинет",
                                                             image: UIImage(systemName: "person.circle"),
                                                             tag: 4,
                                                             normalColor: .gray,
                                                             selectedColor: .black)
        
        self.setViewControllers([
            krishaKzViewController,
            favoritesViewController,
            applyViewController,
            messagesViewController,
            accountViewController
        ], animated: true)
    }
    
    
}
