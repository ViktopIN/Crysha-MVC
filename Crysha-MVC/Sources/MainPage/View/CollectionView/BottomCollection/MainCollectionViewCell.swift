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
                                                           and: 5)
    
    // topView
    private lazy var topView = addDefaultView()
    
    // topStackView in topView
    private lazy var topStackView = addDefaultStackView(with: .vertical,
                                                        distribution: .fillEqually,
                                                        and: 0)
    private lazy var priceLabel = addDefaultLabel(with: 10)
    
    private lazy var shortDescriptionLabel = addDefaultLabel(with: 10)
    
    // middleStackView
    private lazy var middleStackView = addDefaultStackView(with: .horizontal,
                                                           distribution: .fillProportionally,
                                                           and: 0)
    
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
    
    private lazy var accountType = addDefaultLabel(with: 10)
    
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
        addSubview(parentStackView)
        parentStackView.addArrangedSubview(topView)
        parentStackView.addArrangedSubview(middleStackView)
        parentStackView.addArrangedSubview(secondMiddleView)
        parentStackView.addArrangedSubview(bottomView)
        
        topView.addSubview(topStackView)
        topStackView.addArrangedSubview(priceLabel)
        topStackView.addArrangedSubview(shortDescriptionLabel)
        
        middleStackView.addArrangedSubview(mainThumbnail)
        locationView.addSubview(locationLabelsStack)
        locationLabelsStack.addArrangedSubview(inCityLocationLabel)
        locationLabelsStack.addArrangedSubview(cityLocationLabel)
        middleStackView.addArrangedSubview(locationView)
        
        secondMiddleView.addSubview(accountType)
        
        bottomView.addSubview(dateLabel)
        bottomView.addSubview(viewsLabel)
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
                shortDescriptionLabel.topAnchor.constraint(equalTo: priceLabel.topAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                locationLabelsStack.leadingAnchor.constraint(equalTo: locationView.leadingAnchor),
                locationLabelsStack.topAnchor.constraint(equalTo: locationView.topAnchor),
                locationLabelsStack.trailingAnchor.constraint(equalTo: locationView.trailingAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                dateLabel.leadingAnchor.constraint(equalTo: secondMiddleView.leadingAnchor),
                dateLabel.topAnchor.constraint(equalTo: secondMiddleView.topAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                accountType.leadingAnchor.constraint(equalTo: secondMiddleView.leadingAnchor),
                accountType.topAnchor.constraint(equalTo: secondMiddleView.topAnchor)
            ]
        )
    }
    
    // MARK: - Methods
    
    func takeModelToCell(this model: MainSectionCellModel) {
        priceLabel.text = model.price.addTenge()
        shortDescriptionLabel.attributedText = model.shortDescription.superscriptIndex()
        mainThumbnail.image = model.mainThumbnail
        inCityLocationLabel.text = model.inCityLocation
        cityLocationLabel.text = model.inCityLocation
        dateLabel.text = model.date
        let viewImage = UIImage(systemName: "eye")
        viewsLabel.attributedText = String(model.views).addImageToLabelString(this: viewImage,
                                                                              textIsFirst: false)
        let cellsBackgroundColor = model.isHotOffer ? UIColor(named: "hotMainCollectionCellsColor") : UIColor(named: "defaultMainCollectionCellsColor")
        backgroundColor = cellsBackgroundColor
        
        let accountTypeImage = UIImage(systemName: "person.text.rectangle.fill")
        accountType.attributedText = String(model.accountType.rawValue).addImageToLabelString(this: accountTypeImage,
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
        return stackView
    }
    
    private func addDefaultImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}
