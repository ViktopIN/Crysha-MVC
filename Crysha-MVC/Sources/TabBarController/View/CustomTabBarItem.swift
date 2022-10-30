//
//  CustomTabBarItem.swift
//  Crysha-MVC
//
//  Created by Виктор on 20.10.2022.
//

import UIKit

class CustomTabBarItem: UITabBarItem {
    private var selectedColor: UIColor
    init(title: String?,
         image: UIImage?,
         tag: Int,
         normalColor: UIColor,
         selectedColor: UIColor) {
        self.selectedColor = selectedColor
        super.init()
        self.title = title
        self.image = image?.withTintColor(normalColor, renderingMode: .alwaysOriginal)
        self.selectedImage = image?.withTintColor(selectedColor, renderingMode: .alwaysOriginal)
        self.tag = tag
        setTitleTextAttributes([.foregroundColor : selectedColor], for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
