//
//  NavigationControllerExtension.swift
//  Crysha-MVC
//
//  Created by Виктор on 23.10.2022.
//

import UIKit

extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        insertImage()
    }
    
    func insertImage() {
        let image = UIImageView(image: UIImage(named: "leftItemNavigationControllerImage"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.contentsRect = CGRect(x: 0.134, y: 0.18, width: 0.73, height: 0.63)
        image.layer.contentsGravity = .resizeAspectFill
        self.navigationBar.addSubview(image)
        NSLayoutConstraint.activate(
            [
                image.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 25),
                image.topAnchor.constraint(equalTo: navigationBar.topAnchor),
                image.heightAnchor.constraint(equalTo: navigationBar.heightAnchor, multiplier: 0.7),
                image.widthAnchor.constraint(equalTo: navigationBar.widthAnchor, multiplier: 1/5)
            ]
        )
    }
    
    func insertLanguageMenu() {
        let button: UIButton = {
            let button = UIButton()
            
            return button
        }()
    }
}
