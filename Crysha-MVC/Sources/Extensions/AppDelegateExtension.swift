//
//  NavigationControllerExtension.swift
//  Crysha-MVC
//
//  Created by Виктор on 23.10.2022.
//

import UIKit

extension AppDelegate {
    func setNavigationControllerBackgroundColor(_ colorName: String) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: colorName)
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
