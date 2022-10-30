//
//  CustomTabBarController.swift
//  Crysha-MVC
//
//  Created by Виктор on 20.10.2022.
//

import UIKit

class CustomTabBarController: UITabBarController {
    var inputViewControllers = [(UIViewController, TabBarItemModel)]()
    
    init(inputViewControllers: [(UIViewController, TabBarItemModel)]) {
        self.inputViewControllers = inputViewControllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarController(viewControllers: inputViewControllers)
    }
    func configureTabBarController(viewControllers: [(UIViewController, TabBarItemModel)]) {
        self.tabBar.backgroundColor = .white
        func setBarItem(_ viewController: UIViewController,
                        tabBarItemModel: TabBarItemModel) -> UIViewController {
            viewController.tabBarItem = CustomTabBarItem(title: tabBarItemModel.title,
                                                         image: UIImage(systemName: tabBarItemModel.imageName),
                                                         tag: tabBarItemModel.tag,
                                                         normalColor: tabBarItemModel.normalColor,
                                                         selectedColor: tabBarItemModel.selectedColor)
            return viewController
        }
        var returnVCArray = [UIViewController]()
        let amountVC = viewControllers.map {
            $0.0
        }
        var amountTabBarItemsModels = viewControllers.map {
            $0.1
        }
        for (n, viewController) in amountVC.enumerated() {
            let count = viewControllers.count
            if count == 3 || count >= 5 {
                var centerIndex = Int()
                if count == 3 {
                    centerIndex = 1
                } else {
                    centerIndex = 2
                }
                if n != centerIndex {
                    returnVCArray.append(setBarItem(viewController,
                                                    tabBarItemModel: amountTabBarItemsModels[n]))
                } else {
                    amountTabBarItemsModels[n].normalColor = .link
                    returnVCArray.append(setBarItem(viewController,
                                                    tabBarItemModel: amountTabBarItemsModels[n]))
                }
            }
            else {
                returnVCArray.append(setBarItem(viewController,
                                                tabBarItemModel: amountTabBarItemsModels[n]))
            }
            self.viewControllers = returnVCArray
        }
    }
}
