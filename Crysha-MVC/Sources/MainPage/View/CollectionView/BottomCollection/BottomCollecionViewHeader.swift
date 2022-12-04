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
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Горячие предложения в Лапландии"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "headerColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(headerView)
        headerView.addSubview(headerLabel)
    }
    
    private func layoutSetup() {
        NSLayoutConstraint.activate(
            [
                headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 30)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                headerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                headerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                headerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ]
        )    }
}
