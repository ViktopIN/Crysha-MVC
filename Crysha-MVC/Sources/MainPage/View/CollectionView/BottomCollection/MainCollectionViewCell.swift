//
//  MainCollectionViewCell.swift
//  Crysha-MVC
//
//  Created by Виктор on 25.10.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let reuseID = "mainCollectionViewCell"
    
    // MARK: - Views
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
