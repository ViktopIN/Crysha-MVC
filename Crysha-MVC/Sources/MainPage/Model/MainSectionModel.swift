//
//  MainSectionModel.swift
//  Crysha-MVC
//
//  Created by Виктор on 25.10.2022.
//

import UIKit

struct MainSectionCellModel {
    let price: Int
    let shortDescription: String
    let mainThumbnail: UIImage
    let inCityLocation: String
    let cityLocation: String
    let accountType: AccountType
    let date: String
    let views: Int
    let isHotOffer: Bool = false
}

enum AccountType: String {
    case specialist = "Специалист"
    case company = "Компания"
    case owner = "Хозяин недвижимости"
}
