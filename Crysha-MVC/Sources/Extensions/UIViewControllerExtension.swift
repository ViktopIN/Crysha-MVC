//
//  UIViewControllerExtension.swift
//  Crysha-MVC
//
//  Created by Виктор on 20.10.2022.
//

import UIKit

extension UIViewController {
    func getPlugLabel() {
        self.view.backgroundColor = .white
        let label: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.text = String(describing: self)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.numberOfLines = 0
            return label
        }()
        
        self.view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 100),
            label.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
