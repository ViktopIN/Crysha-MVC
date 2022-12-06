//
//  LogoReusableView.swift
//  Crysha-MVC
//
//  Created by Виктор on 02.11.2022.
//

import UIKit

class LogoReusableView: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let reuseID = "logoReusableView"
    
    // MARK: - Views
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor(named: "navigationControllerColor")
        imageView.layer.contentsGravity = .resizeAspect
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Settings

    private func setupHierarchy() {
        addSubview(imageView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                imageView.topAnchor.constraint(equalTo: topAnchor),
                imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
        )
    }
}
