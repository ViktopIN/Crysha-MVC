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

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let krishaViewController = UINavigationController(rootViewController: ViewController())
        let krishaViewControllerItemModel = TabBarItemModel(title: "Krisha.kz",
                                                            imageName: "house.circle.fill",
                                                            tag: 0)
        
        let favoritesViewController = FavoritesViewController()
        let favoritesViewControllerItemModel = TabBarItemModel(title: "Избранное",
                                                               imageName: "heart",
                                                               tag: 1)
        
        let applyViewController = ApplyViewController()
        let applyViewControllerItemModel = TabBarItemModel(title: "Подать",
                                                           imageName: "plus.rectangle.fill",
                                                           tag: 2)
        
        let messagesViewController = MessagesViewController()
        let messagesViewControllerItemModel = TabBarItemModel(title: "Cообщения",
                                                              imageName: "envelope",
                                                              tag: 3)
        
        let accountViewController = AccountViewController()
        let accountViewControllerItemModel = TabBarItemModel(title: "Кабинет",
                                                             imageName: "person.circle",
                                                             tag: 4)
        
        let inputViewControllers: [(UIViewController, TabBarItemModel)] = [(krishaViewController, krishaViewControllerItemModel),
                                                                           (favoritesViewController, favoritesViewControllerItemModel),
                                                                           (applyViewController, applyViewControllerItemModel),
                                                                           (messagesViewController, messagesViewControllerItemModel),
                                                                           (accountViewController, accountViewControllerItemModel)]
        
        let tabBarController = CustomTabBarController(inputViewControllers: inputViewControllers)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }
}
