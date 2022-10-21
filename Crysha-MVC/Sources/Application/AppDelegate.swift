//
//  AppDelegate.swift
//  Crysha-MVC
//
//  Created by Виктор on 17.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .systemBackground.withAlphaComponent(0.4)
        
        let krishaKzViewController = ViewController()
        krishaKzViewController.tabBarItem = UITabBarItem(title: "Krisha.kz", image: UIImage(systemName: "house.circle.fill"), tag: 0)
        
        let favoritesViewController = FavoritesViewController()
        favoritesViewController.tabBarItem = UITabBarItem(title: "Избранное", image: .init(systemName: "heart"), tag: 1)
        
        let applyViewController = ApplyViewController()
        let applyViewControllerBarItem = UITabBarItem(title: "Для Вас", image: .init(systemName: "plus.rectangle.fill"), tag: 2)
        applyViewController.tabBarItem = applyViewControllerBarItem

        let messagesViewController = MessagesViewController()
        messagesViewController.tabBarItem = UITabBarItem(title: "Cообщения", image: .init(systemName: "envelope"), tag: 3)
        
        let accountViewController = AccountViewController()
        accountViewController.tabBarItem = UITabBarItem(title: "Кабинет", image: .init(systemName: "person.circle"), tag: 4)
        
        tabBarController.setViewControllers([
            krishaKzViewController,
            favoritesViewController,
            applyViewController,
            messagesViewController,
            accountViewController
        ], animated: true)
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }
}
