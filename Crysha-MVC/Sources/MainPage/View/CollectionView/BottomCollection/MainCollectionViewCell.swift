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
    var isHotOffer = false
    
    // MARK: - Views
    
    private lazy var parentStackView = addDefaultStackView(with: .vertical,
                                                           distribution: .fillProportionally,
                                                           and: 5)
    
    // topView
    private lazy var topView = addDefaultView()
    
    // stackView in topView
    private lazy var priceLabel = addDefaultLabel(with: 10)
    
    private lazy var shortDescriptionLabel = addDefaultLabel(with: 10)
    
    // middleStackView
    private lazy var middleStackView = addDefaultStackView(with: .horizontal, distribution: .fillProportionally, and: 0)
    
    private lazy var mainThumbnail = addDefaultImageView()
    
    // locationLabelsStack in locationView. locationView in middleStackView
    private lazy var locationView = addDefaultView()
    
    private lazy var locationLabelsStack = addDefaultStackView(with: .vertical,
                                                               distribution: .fillEqually,
                                                               and: 0)
    
    private lazy var inCityLocationLabel = addDefaultLabel(with: 10)
    
    private lazy var cityLocationLabel = addDefaultLabel(with: 10)
    
    // secondMiddleView
    private lazy var secondMiddleView = addDefaultView()
    
    private lazy var accountTypeImage = addDefaultImageView()
    
    private lazy var accountType = addDefaultLabel(with: 10)
    // bottomView
    private lazy var bottomView = addDefaultView()
    
    private lazy var dateLabel = addDefaultLabel(with: 10)
    
    private lazy var viewsLabel = addDefaultLabel(with: 10)
    
    // MARK: - Initialise
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        addSubview(parentStackView)
        topView.addSubview(priceLabel)
        topView.addSubview(shortDescriptionLabel)
        parentStackView.addArrangedSubview(topView)
        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                parentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                parentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
                parentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                parentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                priceLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
                priceLabel.topAnchor.constraint(equalTo: topView.topAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                shortDescriptionLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
                shortDescriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor)
            ]
        )
    }
    
    private func setupView() {
        let cellsBackgroundColor = isHotOffer ? UIColor(named: "hotMainCollectionCellsColor") : UIColor(named: "defaultMainCollectionCellsColor")
        backgroundColor = cellsBackgroundColor
    }
    
    // MARK: - Methods
    
    func takeModelToCell(this model: MainSectionCellModel) {
        priceLabel.text = model.price.addTenge()
        shortDescriptionLabel.text = model.shortDescription
        mainThumbnail.image = model.mainThumbnail
        inCityLocationLabel.text = model.inCityLocation
        cityLocationLabel.text = model.inCityLocation
        dateLabel.text = model.date
        viewsLabel.text = String(model.views)
        isHotOffer = model.isHotOffer
    }
    
    private func addDefaultLabel(with fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func addDefaultView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func addDefaultStackView(with axis: NSLayoutConstraint.Axis,
                                     distribution: UIStackView.Distribution,
                                     and spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.spacing = spacing
        return stackView
    }
    
    private func addDefaultImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}
