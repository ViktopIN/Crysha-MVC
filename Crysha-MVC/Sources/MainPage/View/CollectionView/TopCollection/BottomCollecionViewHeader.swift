//
//  BottomCollecionViewHeader.swift
//  Crysha-MVC
//
//  Created by Виктор on 26.10.2022.
//

import UIKit

class BottomCollecionViewHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let reuseID = "BottomCollecionViewHeader"
    
    // MARK: - Views

    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Горячие предложения в Тацахстане"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialiser
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        hierarchySetup()
        layoutSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Settings
    
    private func hierarchySetup() {
        addSubview(headerLabel)
    }
    
    private func layoutSetup() {
        NSLayoutConstraint.activate(
            [
                headerLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
                headerLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 28)
            ]
        )
    }
    
    private func setupView() {
        backgroundColor = UIColor(named: "headerColor")
    }
}
