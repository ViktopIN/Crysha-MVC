//
//  ImageViewSwiperCell.swift
//  Crysha-MVC
//
//  Created by Виктор on 31.10.2022.
//

import UIKit

class ImageViewSwiperCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let reuseID = "imageViewSwiperCell"
    
    // MARK: - Views
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Lifecycle
    
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
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        )
    }
    
    // MARK: - Methods
    
    func setCell(image: UIImage?) {
        imageView.image = image
    }
}
