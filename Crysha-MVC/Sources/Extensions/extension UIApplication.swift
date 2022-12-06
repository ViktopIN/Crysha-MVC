//
//  extension UIApplication.swift
//  Crysha-MVC
//
//  Created by Виктор on 21.11.2022.
//

import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

