//
//  IntegerExtension.swift
//  Crysha-MVC
//
//  Created by Виктор on 26.10.2022.
//

import Foundation

extension Int {
    func numberFormatToStringOutput() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = " "
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: self as NSNumber)
    }
    
    func addTenge() -> String? {
        let unsetString = self.numberFormatToStringOutput()
        return "\(unsetString ?? "0") \u{20B8}"
    }
}
