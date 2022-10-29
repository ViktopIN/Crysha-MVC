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
                                                           distribution: .fill,
                                                           and: 7)
    
    // topStackView
    private lazy var topStackView = addDefaultStackView(with: .vertical,
                                                        distribution: .fill,
                                                        and: 0)
    private lazy var priceLabel = addDefaultLabel(with: 16,
                                                  fontWeight: .medium,
                                                  and: .black)
    
    private lazy var shortDescriptionLabel = addDefaultLabel(with: 14,
                                                             fontWeight: .medium,
                                                             and: .link)
    
    // middleStackView
    private lazy var middleStackView = addDefaultStackView(with: .horizontal,
                                                           distribution: .fill,
                                                           and: 7)

    private lazy var mainThumbnail = addDefaultImageView()

    // locationLabelsStack in locationView. locationView in middleStackView
    private lazy var locationView = addDefaultView()

    private lazy var inCityLocationLabel = addDefaultLabel(with: 14, fontWeight: .regular, and: .black)

    private lazy var cityLocationLabel = addDefaultLabel(with: 14, fontWeight: .regular, and: .gray)

    // secondMiddleView
    private lazy var secondMiddleView = addDefaultView()

    private lazy var accountTypeLabel = addDefaultLabel(with: 14, fontWeight: .regular, and: .black)

    // bottomView
    private lazy var bottomView = addDefaultView()

    private lazy var dateLabel = addDefaultLabel(with: 14,
                                                 fontWeight: .regular,
                                                 and: .gray)

    private lazy var viewsLabel = addDefaultLabel(with: 14,
                                                  fontWeight: .regular,
                                                  and: .gray)
    
    // MARK: - Initialise
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Settings
    
    private func setupView() {
        parentStackView.isLayoutMarginsRelativeArrangement = true
        parentStackView.layoutMargins = UIEdgeInsets(top: 8,
                                                     left: 16,
                                                     bottom: 0,
                                                     right: 16)
        
        mainThumbnail.layer.masksToBounds = true
        mainThumbnail.layer.cornerRadius = 5
        
        inCityLocationLabel.numberOfLines = 0
        cityLocationLabel.numberOfLines = 0
        
        middleStackView.alignment = .fill
        
        // add line in bottomView
        DispatchQueue.main.async {
            let bottomLineLayer = CAShapeLayer()
            self.bottomView.layer.addSublayer(bottomLineLayer)
            let path = UIBezierPath()
            path.move(to: CGPoint(x: self.bottomView.bounds.minX, y: self.bottomView.bounds.minY))
            path.addLine(to: CGPoint(x: self.bottomView.bounds.maxX, y: self.bottomView.bounds.minY))
            print(self.bottomView.bounds.maxX)
            bottomLineLayer.path = path.cgPath
            bottomLineLayer.strokeColor = UIColor.lightGray.cgColor
            bottomLineLayer.lineWidth = 0.5
            bottomLineLayer.strokeEnd = 1
            bottomLineLayer.fillColor = nil
            bottomLineLayer.lineCap = .round
        }
    }
    
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
                topStackView.heightAnchor.constraint(equalTo: parentStackView.heightAnchor, multiplier: 1/5)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                mainThumbnail.heightAnchor.constraint(equalTo: parentStackView.heightAnchor, multiplier: 3/7),
                mainThumbnail.widthAnchor.constraint(equalTo: parentStackView.widthAnchor, multiplier: 2/5),
                mainThumbnail.topAnchor.constraint(equalTo: middleStackView.topAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                inCityLocationLabel.topAnchor.constraint(equalTo: middleStackView.topAnchor, constant: 3),
                inCityLocationLabel.widthAnchor.constraint(equalTo: middleStackView.widthAnchor, multiplier: 5/9)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                cityLocationLabel.topAnchor.constraint(equalTo: inCityLocationLabel.bottomAnchor, constant: 7),
                cityLocationLabel.widthAnchor.constraint(equalTo: middleStackView.widthAnchor, multiplier: 5/9)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                accountTypeLabel.heightAnchor.constraint(equalTo: parentStackView.heightAnchor, multiplier: 1/10)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                secondMiddleView.heightAnchor.constraint(equalTo: accountTypeLabel.heightAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                dateLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 7)
            ]
        )

        
        NSLayoutConstraint.activate(
            [
                viewsLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 15),
                viewsLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 7)
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
    
    private func addDefaultLabel(with fontSize: CGFloat,
                                 fontWeight: UIFont.Weight,
                                 and fontColor: UIColor) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        label.textColor = fontColor
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
