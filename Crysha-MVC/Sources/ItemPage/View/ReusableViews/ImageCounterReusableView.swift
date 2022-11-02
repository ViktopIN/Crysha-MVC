//
//  ImageCounterReusableView.swift
//  Crysha-MVC
//
//  Created by Виктор on 02.11.2022.
//

import UIKit

class ImageCounterReusableView: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let reuseID = "imageCounterReusableView"
    
    // MARK: - Views
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textAlignment = .center
        label.backgroundColor = .black.withAlphaComponent(0.5)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        return label
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
        addSubview(label)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                label.topAnchor.constraint(equalTo: topAnchor),
                label.bottomAnchor.constraint(equalTo: bottomAnchor),
                label.leadingAnchor.constraint(equalTo: leadingAnchor),
                label.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
        )
    }
    
    // MARK: - Methods
    
    func configure(labelText: String) {
        label.text = labelText
    }
}
