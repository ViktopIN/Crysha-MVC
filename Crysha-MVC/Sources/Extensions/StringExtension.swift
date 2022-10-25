//
//  StringExtension.swift
//  Crysha-MVC
//
//  Created by Виктор on 25.10.2022.
//

import Foundation

extension String {
    func addTenge(to price: Int) -> String {
        "\(String(price)) \u{20B8}"
    }
}
