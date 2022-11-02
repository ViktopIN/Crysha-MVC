//
//  MainSectionModel.swift
//  Crysha-MVC
//
//  Created by Виктор on 25.10.2022.
//

import UIKit

struct MainModel {
    let price: Int
    let shortDescription: String
    let mainThumbnail: [UIImage?]
    let inCityLocation: String
    let cityLocation: String
    let accountType: AccountType
    let date: String
    let views: Int
    let isHotOffer: Bool
    let floor: (current: Int,total: Int)
    let area: Int
    let furnitureType: FurnitureType
    let bathroomAmount: Int
    let flatState: FlatStateType
    let description: String
    
    static func getModel() -> [MainModel] {
        var returnArray = [MainModel]()
        let price = [20000, 270000, 12000]
        let shortDescription = ["1-комн. квартира \u{00B7} 49 м2 \u{00B7} 10/12 этаж посуточно", "2-комн. квартира \u{00B7} 65 м2 \u{00B7} 1/10 этаж на длитель...", "1-комн. квартира \u{00B7} 42 м2 \u{00B7} 5/10 этаж посуточно"]
        let mainThumbnailName = [["flat1", "flat2", "flat3"], ["flat2", "flat3", "flat1"], ["flat3", "flat1", "flat2"]]
        let inCityLocation = ["мкр Калкаман-2, Жунисова - Сабденова Жунисова ЖК \"Alma City\"", "Макатаева 131 - Муратабаева ЖК \"Atlant\"", "Сейфуллина 497 - Макатаева"]
        let cityLocation = ["Алматы", "Астана", "Шымкент"]
        let accountType = [AccountType.company, AccountType.owner, AccountType.specialist]
        let date = ["17 ноября", "18 декабря", "1 июля"]
        let view = [1243, 1345145, 12]
        let isHotOffer = [false, true, false]
        let floor = [(2, 9), (1, 10), (54, 9235)]
        let area = [23, 52, 255]
        let furnitures = [FurnitureType.full, FurnitureType.partly, FurnitureType.none]
        let bathrooms = [1, 1, 1]
        let flatState = [FlatStateType.excelent, FlatStateType.good, FlatStateType.tolerable]
        let descriptions = "Сдаётся новая двух-комнатная квартира в центре Астаны, площадью 64 кв. Полностью мебелирована, есть вся необходимая новая техника, ковры и интернет. Этаж 1 из 10. Высота потолков 3 метра. Имеются все удобства для проживания. Большой двор с чистой детской площадкой. Вход в подъезд с двух сторон. Магазины, салоны красоты, аптеки, школа рисования, детские сады рядом. Expo и ТРЦ Mega рядом. Сдаётся порядочным, чистоплотным, добросовестным, не курящим и пунктуальным (в плане оплаты) людям. Оплата 400.000 в месяц. В самом начале оплачиваются два месяца сразу."
        for (n, i) in price.enumerated() {
            let model = MainModel(price: i,
                                  shortDescription: shortDescription[n],
                                  mainThumbnail: mainThumbnailName[n].map({UIImage(named: $0)}),
                                  inCityLocation: inCityLocation[n],
                                  cityLocation: cityLocation[n],
                                  accountType: accountType[n],
                                  date: date[n],
                                  views: view[n],
                                  isHotOffer: isHotOffer[n],
                                  floor: floor[n],
                                  area: area[n],
                                  furnitureType: furnitures[n],
                                  bathroomAmount: bathrooms[n],
                                  flatState: flatState[n],
                                  description: descriptions)
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

enum FurnitureType: String {
    case full = "Полностью"
    case partly = "Частично"
    case none = "Немебелирована"
}

enum FlatStateType: String {
    case excelent = "Замечательное"
    case good = "Хорошее"
    case tolerable = "Удовлетворительное"
}
