//
//  NavigationControllerExtension.swift
//  Crysha-MVC
//
//  Created by Виктор on 23.10.2022.
//

import UIKit

extension AppDelegate {
    func setNavigationControllerBackgroundColor(_ color: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = color
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
