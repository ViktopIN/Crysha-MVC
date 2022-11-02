//
//  SharedAndFavoritesPanelReusableView.swift
//  Crysha-MVC
//
//  Created by Виктор on 02.11.2022.
//

import UIKit

class SharedAndFavoritesPanelReusableView: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let reuseID = "sharedAndFavoritesPanelReusableView"
    
    // MARK: - Views
    
    private lazy var shareButton = createButton(systemImageName: "square.and.arrow.up")
    
    private lazy var favoriteButton = createButton(systemImageName: "heart")
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Settings

    private func setupHierarchy() {
        addSubview(favoriteButton)
        addSubview(shareButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                favoriteButton.topAnchor.constraint(equalTo: topAnchor, constant: 15),
                favoriteButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
                favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                favoriteButton.widthAnchor.constraint(equalTo: favoriteButton.heightAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                shareButton.topAnchor.constraint(equalTo: topAnchor, constant: 15),
                shareButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
                shareButton.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -15),
                shareButton.widthAnchor.constraint(equalTo: shareButton.heightAnchor)
            ]
        )
    }
    
    private func setupView() {
        backgroundColor = .clear
    }
    
    // MARK: - Methods
    private func createButton(systemImageName: String = "eye") -> UIButton {
        let button = UIButton()
        let image = UIImage(systemName: systemImageName)?.withTintColor(.gray,
                                                                        renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.topAnchor.constraint(equalTo: button.topAnchor).isActive = true
        button.imageView?.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        button.imageView?.leadingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        button.imageView?.trailingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
