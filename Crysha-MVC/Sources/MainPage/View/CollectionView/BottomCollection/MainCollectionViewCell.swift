//
//  MainCollectionViewCell.swift
//  Crysha-MVC
//
//  Created by Виктор on 25.10.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let reuseID = "mainCollectionViewCell"
    var isHotOffer = false
    
    // MARK: - Views
    
    private lazy var parentStackView = addDefaultStackView(with: .vertical,
                                                           distribution: .fillProportionally,
                                                           and: 0)
    
    // topStackView
    private lazy var topStackView = addDefaultStackView(with: .vertical,
                                                        distribution: .fillEqually,
                                                        and: 0)
    private lazy var priceLabel = addDefaultLabel(with: 10)
    
    private lazy var shortDescriptionLabel = addDefaultLabel(with: 10)
    
    // middleStackView
    private lazy var middleStackView = addDefaultStackView(with: .horizontal,
                                                           distribution: .fillEqually,
                                                           and: 0)
    
    private lazy var mainThumbnail = addDefaultImageView()
    
    // locationLabelsStack in locationView. locationView in middleStackView
    private lazy var locationView = addDefaultView()
   
    private lazy var inCityLocationLabel = addDefaultLabel(with: 10)
    
    private lazy var cityLocationLabel = addDefaultLabel(with: 10)
    
    // secondMiddleView
    private lazy var secondMiddleView = addDefaultView()
    
    private lazy var accountTypeLabel = addDefaultLabel(with: 10)
    
    // bottomView
    private lazy var bottomView = addDefaultView()
    
    private lazy var dateLabel = addDefaultLabel(with: 10)
    
    private lazy var viewsLabel = addDefaultLabel(with: 10)
    
    // MARK: - Initialise
    
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
        contentView.addSubview(parentStackView)
        parentStackView.addArrangedSubview(topStackView)
        parentStackView.addArrangedSubview(middleStackView)
        parentStackView.addArrangedSubview(secondMiddleView)
        parentStackView.addArrangedSubview(bottomView)

        topStackView.addArrangedSubview(priceLabel)
        topStackView.addArrangedSubview(shortDescriptionLabel)

        middleStackView.addArrangedSubview(mainThumbnail)
        middleStackView.addArrangedSubview(locationView)
        locationView.addSubview(inCityLocationLabel)
        locationView.addSubview(cityLocationLabel)

        secondMiddleView.addSubview(accountTypeLabel)

        bottomView.addSubview(dateLabel)
        bottomView.addSubview(viewsLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                parentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
                parentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                parentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                parentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                topStackView.topAnchor.constraint(equalTo: parentStackView.topAnchor),
                topStackView.leadingAnchor.constraint(equalTo: parentStackView.leadingAnchor),
                topStackView.trailingAnchor.constraint(equalTo: parentStackView.trailingAnchor),
                topStackView.heightAnchor.constraint(equalToConstant: parentStackView.bounds.height * 2/7)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                priceLabel.topAnchor.constraint(equalTo: topStackView.topAnchor),
                priceLabel.leadingAnchor.constraint(equalTo: topStackView.leadingAnchor),
                priceLabel.trailingAnchor.constraint(equalTo: topStackView.trailingAnchor),
                priceLabel.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                middleStackView.leadingAnchor.constraint(equalTo: parentStackView.leadingAnchor),
                middleStackView.trailingAnchor.constraint(equalTo: parentStackView.trailingAnchor),
                middleStackView.heightAnchor.constraint(equalToConstant: parentStackView.bounds.height * 3/7)
            ]
        )

        NSLayoutConstraint.activate(
            [
                mainThumbnail.leadingAnchor.constraint(equalTo: middleStackView.leadingAnchor),
                mainThumbnail.topAnchor.constraint(equalTo: middleStackView.topAnchor),
                mainThumbnail.bottomAnchor.constraint(equalTo: middleStackView.bottomAnchor)
            ]
        )

        NSLayoutConstraint.activate(
            [
                locationView.trailingAnchor.constraint(equalTo: middleStackView.trailingAnchor),
                locationView.topAnchor.constraint(equalTo: middleStackView.topAnchor),
                locationView.bottomAnchor.constraint(equalTo: middleStackView.bottomAnchor)
            ]
        )

        NSLayoutConstraint.activate(
            [
                inCityLocationLabel.leadingAnchor.constraint(equalTo: locationView.leadingAnchor),
                inCityLocationLabel.trailingAnchor.constraint(equalTo: locationView.trailingAnchor),
                inCityLocationLabel.topAnchor.constraint(equalTo: locationView.topAnchor),
                inCityLocationLabel.heightAnchor.constraint(equalTo: locationView.heightAnchor, multiplier: 1/5)
            ]
        )

        NSLayoutConstraint.activate(
            [
                cityLocationLabel.leadingAnchor.constraint(equalTo: locationView.leadingAnchor),
                cityLocationLabel.trailingAnchor.constraint(equalTo: locationView.trailingAnchor),
                cityLocationLabel.topAnchor.constraint(equalTo: inCityLocationLabel.bottomAnchor),
                cityLocationLabel.heightAnchor.constraint(equalTo: locationView.heightAnchor, multiplier: 1/5)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                secondMiddleView.leadingAnchor.constraint(equalTo: parentStackView.leadingAnchor),
                secondMiddleView.trailingAnchor.constraint(equalTo: parentStackView.trailingAnchor),
                secondMiddleView.heightAnchor.constraint(equalToConstant: parentStackView.bounds.height * 1/7)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                accountTypeLabel.leadingAnchor.constraint(equalTo: secondMiddleView.leadingAnchor),
                accountTypeLabel.trailingAnchor.constraint(equalTo: secondMiddleView.trailingAnchor),
                accountTypeLabel.topAnchor.constraint(equalTo: secondMiddleView.topAnchor),
                accountTypeLabel.widthAnchor.constraint(equalTo: secondMiddleView.widthAnchor, multiplier: 1/4)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                bottomView.leadingAnchor.constraint(equalTo: parentStackView.leadingAnchor),
                bottomView.trailingAnchor.constraint(equalTo: parentStackView.trailingAnchor),
                bottomView.bottomAnchor.constraint(equalTo: parentStackView.bottomAnchor),
                bottomView.heightAnchor.constraint(equalToConstant: parentStackView.bounds.height * 1/7)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                dateLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
                dateLabel.topAnchor.constraint(equalTo: bottomView.topAnchor),
                dateLabel.heightAnchor.constraint(equalTo: bottomView.heightAnchor),
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                viewsLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
                viewsLabel.topAnchor.constraint(equalTo: bottomView.topAnchor),
                viewsLabel.heightAnchor.constraint(equalTo: bottomView.heightAnchor),
            ]
        )
    }
    
    // MARK: - Methods
    
    func takeModelToCell(this model: MainSectionCellModel) {
        priceLabel.text = model.price.addTenge()
        shortDescriptionLabel.attributedText = model.shortDescription.superscriptIndex()
        mainThumbnail.image = model.mainThumbnail
        inCityLocationLabel.text = model.inCityLocation
        cityLocationLabel.text = model.cityLocation
        dateLabel.text = model.date
        let viewImage = UIImage(systemName: "eye")
        viewsLabel.attributedText = String(model.views).addImageToLabelString(this: viewImage,
                                                                              textIsFirst: false)
        let cellsBackgroundColor = model.isHotOffer ? UIColor(named: "hotMainCollectionCellsColor") : UIColor(named: "defaultMainCollectionCellsColor")
        backgroundColor = cellsBackgroundColor
        
        let accountTypeImage = UIImage(systemName: "person.text.rectangle.fill")
        accountTypeLabel.attributedText = String(model.accountType.rawValue).addImageToLabelString(this: accountTypeImage,
                                                                                              textIsFirst: false)
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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func addDefaultImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}
