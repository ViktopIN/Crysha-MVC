//
//  TabBarItemModel.swift
//  Crysha-MVC
//
//  Created by Виктор on 23.10.2022.
//

import UIKit

struct TabBarItemModel {
    let title: String
    let imageName: String
    let tag: Int
    var normalColor: UIColor = .gray
    let selectedColor: UIColor = .black
}
