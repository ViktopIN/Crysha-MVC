//
//  CryshasMainNavigationController.swift
//  Crysha-MVC
//
//  Created by Виктор on 28.11.2022.
//

import UIKit

class CryshasMainNavigationController: UINavigationController {
    
    // MARK: - Methods
        
    func addItemPageViewsToNavBar(titleText: String, backButtonAction: @escaping () -> Void) {
                        
        // Views
        
        let horizontalMainStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            return stackView
        }()
        
        let backButton: UIButton = {
            let button = UIButton(type: .system,
                                  primaryAction: UIAction(handler: { _ in
                return backButtonAction()
            }))
            button.backgroundColor = .white
            button.setImage(.backButtonImage, for: .normal)
            button.layer.masksToBounds = true
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = titleText
            return label
        }()
        
        let sharedNavigationBarButton: UIButton = {
            let button = UIButton()
            let image = UIImage(systemName: "square.and.arrow.up")?.withTintColor(.gray,
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
        }()
        
        let favoriteNavigationBarButton: UIButton = {
            let button = UIButton()
            let image = UIImage(systemName: "heart")?.withTintColor(.gray,
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
        }()
        
        // Set views
        
//        navigationBar.addSubview(horizontalMainStackView)
//        horizontalMainStackView.addArrangedSubview(backButton)
//        horizontalMainStackView.addArrangedSubview(titleLabel)
//        horizontalMainStackView.addArrangedSubview(sharedNavigationBarButton)
//        horizontalMainStackView.addArrangedSubview(favoriteNavigationBarButton)
//
//        NSLayoutConstraint.activate(
//            [
//                horizontalMainStackView.topAnchor.constraint(equalTo: navigationBar.topAnchor),
//                horizontalMainStackView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor),
//                horizontalMainStackView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor),
//                horizontalMainStackView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
//            ]
//        )
        let leadingBackBarButtonItem: UIBarButtonItem = {
            let buttonItem = UIBarButtonItem()
            buttonItem.image = UIImage.backButtonImage
            buttonItem.primaryAction = UIAction(handler: { _ in
                return backButtonAction()
            })
            return buttonItem
        }()
    
    }
}
