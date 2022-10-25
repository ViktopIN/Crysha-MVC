//
//  TableCollectionViewCell.swift
//  Crysha-MVC
//
//  Created by Виктор on 25.10.2022.
//

import UIKit

class TableCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let reuseID = "tableCollectionViewCell"
    
    // MARK: - Views
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var newImageSection: UIImageView = {
        let image = UIImage(named: "newLogo")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var countInSection: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // MARK: - Initialisation
    
    init() {
        super.init(frame: .zero)
        hierarchySetup()
        layoutSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func getModelToCell(this model: TableCellModel) {
        icon.image = model.image
        nameLabel.text = model.name
        if model.isNewSection {
            addNewImageSectioin()
        }
        if let count = model.countInSection {
            countInSection.text = String(count)
            addCountInSection()
        }
    }
    
    private func hierarchySetup() {
        contentView.addSubview(icon)
        contentView.addSubview(nameLabel)
    }
    
    private func layoutSetup() {
        NSLayoutConstraint.activate(
            [
                icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                icon.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/3),
                icon.widthAnchor.constraint(equalTo: icon.heightAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                nameLabel.leadingAnchor.constraint(equalTo: icon.leadingAnchor, constant: 10),
                nameLabel.heightAnchor.constraint(equalTo: icon.heightAnchor)
            ]
        )
    }
    
    private func addNewImageSectioin() {
        DispatchQueue.main.async {
            self.contentView.addSubview(self.newImageSection)
            NSLayoutConstraint.activate(
                [
                    self.newImageSection.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
                    self.newImageSection.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor, constant: 10),
                    self.newImageSection.heightAnchor.constraint(equalTo: self.icon.heightAnchor),
                    self.newImageSection.widthAnchor.constraint(equalTo: self.icon.heightAnchor)
                ]
            )
        }
    }
    
    private func addCountInSection() {
        DispatchQueue.main.async {
            self.contentView.addSubview(self.newImageSection)
            NSLayoutConstraint.activate(
                [
                    self.countInSection.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
                    self.countInSection.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 30),
                    self.countInSection.heightAnchor.constraint(equalTo: self.icon.heightAnchor)
                ]
            )
        }
    }
}
