//
//  TableCellModel.swift
//  Crysha-MVC
//
//  Created by Виктор on 25.10.2022.
//

import UIKit

struct TableCellModel {
    let image: UIImage
    let name: String
    let isNewSection: Bool
    let countInSection: Int?
    
    static func getModels() -> [TableCellModel] {
        var array = [TableCellModel]()
        let image = ["house",
                     "calendar",
                     "key",
                     "books.vertical.circle",
                     "rectangle.grid.1x2",
                     "note.text",
                     "questionmark.square"]
        let name = ["Купить",
                    "Арендовать",
                    "Новостройки",
                    "Оценка недвижимости",
                    "Мои объявления",
                    "Новости",
                    "Крыша гид"]
        let isNewSection = [false,
                            false,
                            false,
                            true,
                            false,
                            false,
                            false]
        let countInSection: [Int?] = [307620,
                                      67196,
                                      nil,
                                      nil,
                                      nil,
                                      nil,
                                      nil]
        
        for (n, image) in image.enumerated() {
            let tableCellModel = TableCellModel(image: UIImage(systemName: image)!,
                                                name: name[n],
                                                isNewSection: isNewSection[n],
                                                countInSection: countInSection[n])
            array.append(tableCellModel)
        }
        return array
    }
}
