//
//  LanguageChangeButton.swift
//  Crysha-MVC
//
//  Created by Виктор on 23.10.2022.
//

import UIKit

class : UIButton {
    func getButtom() {
        let buttonsLabel: UILabel = {
            let label = UILabel()
            label.text = "Рус"
            label.font = UIFont.systemFont(ofSize: 10)
        
            return label
        }()
        
        let buttonsImageView: UIImageView = {
            let imageView = UIImageView(image: UIImage(systemName: "triangle"))
            imageView.layer.isGeometryFlipped = true
            return imageView
        }()
        
        let views = [buttonsLabel, buttonsImageView]
        views.forEach {
            self.addSubview($0)
        }
        NSLayoutConstraint.activate(
            [buttonsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             buttonsImageView.leadingAnchor.constraint(equalTo: buttonsLabel.trailingAnchor,
                                                       constant: 5)
            ]
        )
    }
}
