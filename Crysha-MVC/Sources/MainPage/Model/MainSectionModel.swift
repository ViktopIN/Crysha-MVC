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
    let mainThumbnail: UIImage?
    let inCityLocation: String
    let cityLocation: String
    let accountType: AccountType
    let date: String
    let views: Int
    let isHotOffer: Bool
    
    static func getModel() -> [MainSectionCellModel] {
        var returnArray = [MainSectionCellModel]()
        let price = [20000, 270000, 12000]
        let shortDescription = ["1-комн. квартира \u{00B7} 49 м2 \u{00B7} 10/12 этаж посуточно", "2-комн. квартира \u{00B7} 65 м2 \u{00B7} 1/10 этаж на длитель...", "1-комн. квартира \u{00B7} 42 м2 \u{00B7} 5/10 этаж посуточно"]
        let mainThumbnailName = ["flat1", "flat2", "flat3"]
        let inCityLocation = ["мкр Калкаман-2, Жунисова - Сабденова Жунисова ЖК \"Alma City\"", "Макатаева 131 - Муратабаева ЖК \"Atlant\"", "Сейфуллина 497 - Макатаева"]
        let cityLocation = ["Алматы", "Астана", "Шымкент"]
        let accountType = [AccountType.company, AccountType.owner, AccountType.specialist]
        let date = ["17 ноября", "18 декабря", "1 июля"]
        let view = [1243, 1345145, 12]
        let isHotOffer = [false, true, false]
        for (n, i) in price.enumerated() {
            let model = MainSectionCellModel(price: i,
                                             shortDescription: shortDescription[n],
                                             mainThumbnail: UIImage(named: mainThumbnailName[n]),
                                             inCityLocation: inCityLocation[n],
                                             cityLocation: cityLocation[n],
                                             accountType: accountType[n],
                                             date: date[n],
                                             views: view[n],
                                             isHotOffer: isHotOffer[n])
            returnArray.append(model)
        }
        return returnArray
    }
}

enum AccountType: String {
    case specialist = "Специалист"
    case company = "Компания"
    case owner = "Хозяин недвижимости"
}
