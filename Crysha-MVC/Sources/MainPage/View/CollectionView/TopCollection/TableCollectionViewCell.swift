//
//  TableCollectionViewCell.swift
//  Crysha-MVC
//
//  Created by Виктор on 25.10.2022.
//

import UIKit

class TableCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let reuseID = "tableCollectionViewCell"
    
    // MARK: - Views
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.contentsGravity = .resizeAspectFill
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
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var disclosureIndicatorImage: UIImageView = {
        let image = UIImage(systemName: "chevron.right")?.withTintColor(UIColor.gray, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        hierarchySetup()
        layoutSetup()
        getBottomLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Settings
    
    private func hierarchySetup() {
        contentView.addSubview(icon)
        contentView.addSubview(nameLabel)
        contentView.addSubview(disclosureIndicatorImage)
    }
    
    private func layoutSetup() {
        NSLayoutConstraint.activate(
            [
                icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
                icon.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 4/11),
                icon.widthAnchor.constraint(equalTo: icon.heightAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                nameLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 15),
                nameLabel.heightAnchor.constraint(equalTo: icon.heightAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                disclosureIndicatorImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                disclosureIndicatorImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                disclosureIndicatorImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 3/11),
                disclosureIndicatorImage.widthAnchor.constraint(equalTo: disclosureIndicatorImage.heightAnchor, multiplier: 1/2)
            ]
        )
    }
    
    private func addNewImageSectioin() {
        self.contentView.addSubview(self.newImageSection)
        NSLayoutConstraint.activate(
            [
                self.newImageSection.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
                self.newImageSection.leadingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor, constant: 13),
                self.newImageSection.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 4/5),
                self.newImageSection.widthAnchor.constraint(equalTo: newImageSection.heightAnchor)
            ]
        )
    }
    
    private func addCountInSection() {
        self.contentView.addSubview(self.countInSection)
        NSLayoutConstraint.activate(
            [
                self.countInSection.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
                self.countInSection.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -50),
                self.countInSection.heightAnchor.constraint(equalTo: self.icon.heightAnchor)
            ]
        )
    }
    
    // MARK: - Methods
    
    private func getBottomLayer() {
        let bottomLineLayer = CAShapeLayer()
        layer.addSublayer(bottomLineLayer)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 28 + 24 + 7.5, y: contentView.bounds.maxY))
        path.addLine(to: CGPoint(x: contentView.bounds.maxX, y: contentView.bounds.maxY))
        bottomLineLayer.path = path.cgPath
        bottomLineLayer.strokeColor = UIColor.lightGray.cgColor
        bottomLineLayer.lineWidth = 0.5
        bottomLineLayer.strokeEnd = 1
        bottomLineLayer.fillColor = nil
        bottomLineLayer.lineCap = .round
        
    }
    
    func takeModelToCell(this model: TableCellModel) {
        icon.image = model.image.withTintColor(.gray, renderingMode: .alwaysOriginal)
        nameLabel.text = model.name
        if model.isNewSection {
            addNewImageSectioin()
        }
        if let count = model.countInSection {
            countInSection.text = count.numberFormatToStringOutput()
            addCountInSection()
        }
    }
}
