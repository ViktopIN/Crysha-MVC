//
//  ItemPageView.swift
//  Crysha-MVC
//
//  Created by Виктор on 30.10.2022.
//

import UIKit

class ItemPageView: UIView {
    
    // MARK: - Properties
    
    weak var controller: ItemPageViewControllerProtocol!
    private var mainPageViewController: UIViewController!
    private var countOfImage = Int()
    
    // MARK: - Views
            
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage.backButtonImage, for: .normal)
        button.layer.masksToBounds = false
        button.layer.cornerRadius = Metrics.backButtonsDiameter / 2
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowRadius = 2
        button.layer.shadowOpacity = 0.5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return button
    }()
    
    private lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    private lazy var imageHorizontalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private lazy var imageHorizontalStackView = addStackViewToView(with: .horizontal)
    
    private lazy var pagingImageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
        
    private lazy var labelStackView = addStackViewToView(with: .vertical,
                                                         spacing: Metrics.labelStackViewSpacingValue,
                                                         layoutMargins: UIEdgeInsets(top: 0,
                                                                                     left: Metrics.contentsLeadingTrailingOffset,
                                                                                     bottom: -Metrics.contactsStackViewBottomOffset + Metrics.screenHeight / 18,
                                                                                     right: Metrics.contentsLeadingTrailingOffset))
    private lazy var sharedPanelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var shareButton = createButton(systemImageName: "square.and.arrow.up")
    
    private lazy var favoriteButton = createButton(systemImageName: "heart")
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor(named: "navigationControllerColor")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var labelOfImageCounter: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textAlignment = .center
        label.backgroundColor = .black.withAlphaComponent(0.5)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()


    private lazy var priceLabel = addLabelToView(with: Metrics.titlesFontSize,
                                                 and: .bold)
    private lazy var shortDescriptLabel = addLabelToView(with: Metrics.shortDescriptFontSize,
                                                         and: .light)
    private lazy var mapButton: UIButton = {
        let button = UIButton()
        let buttonImage = UIImage(named: "mapButton")
        button.setImage(buttonImage, for: .normal)
        let screenWidth = UIScreen.main.bounds.width
        button.imageView?.layer.contentsRect = CGRect(x: 0.045, y: 0.07, width: 0.93, height: 0.9)
        button.imageView?.layer.cornerRadius = Metrics.buttonsCornerRadius
        button.imageView?.layer.masksToBounds = true
        button.imageView?.layer.borderWidth = Metrics.buttonMapBorderWidthValue
        button.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
      
    private lazy var locationHorizontalStackView = addStackViewToView(with: .horizontal)
        
    private lazy var locationVerticalStackView = addStackViewToView(with: .vertical,
                                                                    distribution: .fillEqually)

    private lazy var locationViewContainerForMappinImage: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mappinImageView: UIImageView = {
        let imageView = UIImageView(image: Images.mappinImage)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var streetOfLocationLabel = addLabelToView(with: Metrics.mainTextFontSize,
                                                            and: .medium)
    private lazy var areaOfLocationLabel = addLabelToView(with: Metrics.mainTextFontSize,
                                                          and: .medium,
                                                          .gray)
    private lazy var houseTitleLabel = addLabelToView(with: Metrics.titlesFontSize,
                                                      and: .bold)
    private lazy var descriptionTitleLabel = addLabelToView(with: Metrics.titlesFontSize,
                                                            and: .bold)
    private lazy var descriptionValueLabel = addLabelToView(with: Metrics.mainTextFontSize,
                                                            and: .light)
    
    private lazy var contactsButtonStackView = addStackViewToView(with: .horizontal,
                                                                  distribution: .fillEqually,
                                                                  spacing: Metrics.contactsButtonGap,
                                                                  layoutMargins: UIEdgeInsets(top: 0,
                                                                                              left: Metrics.contentsLeadingTrailingOffset,
                                                                                              bottom: 0,
                                                                                              right: Metrics.contentsLeadingTrailingOffset))
    private lazy var messageContactButton = addContactButtons(with: Strings.messageContactButtonLabelTitle,
                                                              and: UIColor.customBlue)
    private lazy var callContactButton = addContactButtons(with: Strings.callContactButtonLabelTitle,
                                                              and: UIColor.customGreen)
    
    private lazy var appearedCustomNavigationBar: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.shadowRadius = 3
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = .zero
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initialiser
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        addSubview(mainScrollView)
        mainScrollView.addSubview(pagingImageContainerView)
        pagingImageContainerView.addSubview(imageHorizontalScrollView)
        imageHorizontalScrollView.addSubview(imageHorizontalStackView)
        mainScrollView.addSubview(labelStackView)
        addSubview(backButton)
        addSubview(contactsButtonStackView)
        contactsButtonStackView.addArrangedSubview(messageContactButton)
        contactsButtonStackView.addArrangedSubview(callContactButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                backButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
                backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                backButton.heightAnchor.constraint(equalToConstant: Metrics.backButtonsDiameter),
                backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                pagingImageContainerView.topAnchor.constraint(equalTo: topAnchor),
                pagingImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
                pagingImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor)
            ]
        )

        let imageViewContainerViewBottom : NSLayoutConstraint!
        imageViewContainerViewBottom = self.pagingImageContainerView.bottomAnchor.constraint(equalTo: self.labelStackView.topAnchor)
        imageViewContainerViewBottom.priority = UILayoutPriority(rawValue: 900)
        imageViewContainerViewBottom.isActive = true
        
        NSLayoutConstraint.activate(
            [
                imageHorizontalScrollView.topAnchor.constraint(equalTo: pagingImageContainerView.topAnchor),
                imageHorizontalScrollView.trailingAnchor.constraint(equalTo: pagingImageContainerView.trailingAnchor),
                imageHorizontalScrollView.leadingAnchor.constraint(equalTo: pagingImageContainerView.leadingAnchor),
                imageHorizontalScrollView.bottomAnchor.constraint(equalTo: pagingImageContainerView.bottomAnchor),
                imageHorizontalScrollView.heightAnchor.constraint(equalTo: pagingImageContainerView.heightAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                imageHorizontalStackView.topAnchor.constraint(equalTo: imageHorizontalScrollView.topAnchor),
                imageHorizontalStackView.trailingAnchor.constraint(equalTo: imageHorizontalScrollView.trailingAnchor),
                imageHorizontalStackView.leadingAnchor.constraint(equalTo: imageHorizontalScrollView.leadingAnchor),
                imageHorizontalStackView.bottomAnchor.constraint(equalTo: imageHorizontalScrollView.bottomAnchor),
                imageHorizontalStackView.heightAnchor.constraint(equalTo: imageHorizontalScrollView.heightAnchor)

            ]
        )

        
        NSLayoutConstraint.activate(
            [
                contactsButtonStackView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                                constant: Metrics.contactsStackViewBottomOffset),
                contactsButtonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                contactsButtonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                contactsButtonStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/18)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                messageContactButton.heightAnchor.constraint(equalTo: contactsButtonStackView.heightAnchor),
                callContactButton.heightAnchor.constraint(equalTo: contactsButtonStackView.heightAnchor)
            ]
        )


        NSLayoutConstraint.activate(
            [
                mainScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                mainScrollView.topAnchor.constraint(equalTo: topAnchor),
                mainScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
                mainScrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        )
        
        labelStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: Metrics.screenWidth * 0.9).isActive = true
        labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        labelStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor).isActive = true
        
    }
    
    private func setupView() {
        backgroundColor = .white
    }
    
    // MARK: - Methods
    
    @objc func goBack() {
        controller.goBack()
    }
    
    func configureView(model: MainModel) {
        let images = model.mainThumbnail
        for image in images {
            if let nonOptionalImage = image {
                let imageView = UIImageView(image: nonOptionalImage)
                imageView.contentMode = .scaleAspectFill
                imageView.clipsToBounds = true
                imageHorizontalStackView.addArrangedSubview(imageView)
                imageView.widthAnchor.constraint(equalToConstant: Metrics.screenWidth).isActive = true
            }
        }
        
        // Configure sharedPanel
        labelStackView.addArrangedSubview(sharedPanelView)
        sharedPanelView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        sharedPanelView.addSubview(favoriteButton)
        sharedPanelView.addSubview(shareButton)
        sharedPanelView.addSubview(logoImageView)
        NSLayoutConstraint.activate(
            [
                favoriteButton.topAnchor.constraint(equalTo: sharedPanelView.topAnchor, constant: 15),
                favoriteButton.bottomAnchor.constraint(equalTo: sharedPanelView.bottomAnchor, constant: -15),
                favoriteButton.trailingAnchor.constraint(equalTo: sharedPanelView.trailingAnchor, constant: -15),
                favoriteButton.widthAnchor.constraint(equalTo: favoriteButton.heightAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                shareButton.topAnchor.constraint(equalTo: sharedPanelView.topAnchor, constant: 15),
                shareButton.bottomAnchor.constraint(equalTo: sharedPanelView.bottomAnchor, constant: -15),
                shareButton.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -15),
                shareButton.widthAnchor.constraint(equalTo: shareButton.heightAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                logoImageView.centerYAnchor.constraint(equalTo: sharedPanelView.topAnchor),
                logoImageView.leadingAnchor.constraint(equalTo: sharedPanelView.leadingAnchor,
                                                       constant: Metrics.logoImageViewLeadingOffset),
                logoImageView.heightAnchor.constraint(equalToConstant: Metrics.screenWidth * 1/5),
                logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor)
            ]
        )
        
        // Configure priceLabel constraints and text
        labelStackView.addArrangedSubview(priceLabel)
        priceLabel.text = model.price.addTenge()
        
        // Configure shortDescriptLabel constraints and text
        labelStackView.addArrangedSubview(shortDescriptLabel)
        shortDescriptLabel.text = model.shortDescription
        
        // Configure mapButton
        labelStackView.addArrangedSubview(mapButton)
        NSLayoutConstraint.activate(
            [
                mapButton.widthAnchor.constraint(equalTo: priceLabel.widthAnchor),
                mapButton.heightAnchor.constraint(equalTo: mapButton.widthAnchor, multiplier: 2/7)
            ]
        )
        
        // Configure locationStackViews
        labelStackView.addArrangedSubview(locationHorizontalStackView)
        locationHorizontalStackView.addArrangedSubview(locationViewContainerForMappinImage)
        NSLayoutConstraint.activate(
            [
                locationViewContainerForMappinImage.widthAnchor.constraint(equalTo: priceLabel.widthAnchor,
                                                                           multiplier: 4/39),
                locationViewContainerForMappinImage.heightAnchor.constraint(equalTo: locationViewContainerForMappinImage.widthAnchor,
                                                                            multiplier: 2)
            ]
        )
        
        locationViewContainerForMappinImage.addSubview(mappinImageView)
        
        NSLayoutConstraint.activate(
            [
                mappinImageView.topAnchor.constraint(equalTo: locationViewContainerForMappinImage.topAnchor,
                                                     constant: Metrics.mappinImageViewTopAnchorOffsetValue),
                mappinImageView.leadingAnchor.constraint(equalTo: locationViewContainerForMappinImage.leadingAnchor),
                mappinImageView.widthAnchor.constraint(equalTo: locationViewContainerForMappinImage.widthAnchor, multiplier: 5/8),
                mappinImageView.heightAnchor.constraint(equalTo: mappinImageView.widthAnchor, multiplier: 0.8)
            ]
        )
        locationHorizontalStackView.addArrangedSubview(locationVerticalStackView)
        locationVerticalStackView.addArrangedSubview(streetOfLocationLabel)
        streetOfLocationLabel.text = "Улица"
        locationVerticalStackView.addArrangedSubview(areaOfLocationLabel)
        areaOfLocationLabel.text = "Район"
        
        labelStackView.addArrangedSubview(houseTitleLabel)
        houseTitleLabel.text = "О Доме"
        
        // Configure specification
        let specifications = ["Этаж", "Площадь, кв.м.", "Мебель", "Кол-во санузлов"]
        for i in 0..<4 {
            var valueText = ""
            switch i {
            case 0:
                valueText = "\(model.floor.current) / \(model.floor.total) этаж"
            case 1:
                valueText = "\(model.area)"
            case 2:
                valueText = model.furnitureType.rawValue
            case 3:
                valueText = "\(model.bathroomAmount)"
            default:
                valueText = "none"
            }
            let horizontalStackView = addStackViewToView(with: .horizontal,
                                                         distribution: .fillEqually)
            let specificationNameLabel = addLabelToView(with: Metrics.mainTextFontSize,
                                                        and: .light,
                                                        .lightGray)
            specificationNameLabel.text = specifications[i]
            let specificationValueLabel = addLabelToView(with: Metrics.mainTextFontSize,
                                                        and: .light)
            specificationValueLabel.text = valueText
            
            labelStackView.addArrangedSubview(horizontalStackView)
            horizontalStackView.addArrangedSubview(specificationNameLabel)
            horizontalStackView.addArrangedSubview(specificationValueLabel)
        }
        
        // Configure descriptionsLabel
        descriptionTitleLabel.text = "Описание"
        labelStackView.addArrangedSubview(descriptionTitleLabel)
        descriptionValueLabel.text = model.description
        labelStackView.addArrangedSubview(descriptionValueLabel)
    }
    
    func configureScrollViewDelegate() -> UIScrollView {
        return mainScrollView
    }
    
    func customNavigationBarIsHidden(_ value: Bool) {
        if value {
            appearedCustomNavigationBar.removeFromSuperview()
            appearedCustomNavigationBar.subviews.forEach({ $0.removeFromSuperview() })
            
        } else {
            guard !self.subviews.contains(appearedCustomNavigationBar) else { return }
            addSubview(appearedCustomNavigationBar)
            NSLayoutConstraint.activate(
                [
                    appearedCustomNavigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
                    appearedCustomNavigationBar.topAnchor.constraint(equalTo: topAnchor),
                    appearedCustomNavigationBar.trailingAnchor.constraint(equalTo: trailingAnchor),
                    appearedCustomNavigationBar.heightAnchor.constraint(equalToConstant: Metrics.screenHeight * 1/10)
                ]
            )
            addToCustomNavigationBar()
            appearedCustomNavigationBar.setNeedsLayout()
        }
    }
    
    private func addToCustomNavigationBar() {
        let navigationBarBackButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage.backButtonImage, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
            return button
        }()
        let navigationBarAnimationLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = shortDescriptLabel.text
            label.alpha = 0
            return label
        }()
        let navigationBarSharedButton = createButton(systemImageName: "square.and.arrow.up")
        let navigationBarHeartButton = createButton(systemImageName: "heart")
        
        navigationBarBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        let buttons = [navigationBarBackButton, navigationBarAnimationLabel, navigationBarSharedButton, navigationBarHeartButton]
        buttons.forEach { appearedCustomNavigationBar.addSubview($0) }
        
        NSLayoutConstraint.activate(
            [
                navigationBarBackButton.topAnchor.constraint(equalTo: appearedCustomNavigationBar.topAnchor, constant: 50),
                navigationBarBackButton.leadingAnchor.constraint(equalTo: appearedCustomNavigationBar.leadingAnchor, constant: 20),
                navigationBarBackButton.heightAnchor.constraint(equalToConstant: Metrics.backButtonsDiameter),
                navigationBarBackButton.widthAnchor.constraint(equalTo: backButton.heightAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                navigationBarAnimationLabel.leadingAnchor.constraint(equalTo: navigationBarBackButton.trailingAnchor, constant: 20),
                navigationBarAnimationLabel.heightAnchor.constraint(equalToConstant: Metrics.backButtonsDiameter),
                navigationBarAnimationLabel.widthAnchor.constraint(equalToConstant: Metrics.screenWidth / 2)
            ]
        )
        
        let labelTopConstraint = navigationBarAnimationLabel.topAnchor.constraint(equalTo: appearedCustomNavigationBar.topAnchor)
        labelTopConstraint.isActive = true
        
        NSLayoutConstraint.activate(
            [
                navigationBarHeartButton.centerYAnchor.constraint(equalTo: navigationBarBackButton.centerYAnchor),
                navigationBarHeartButton.trailingAnchor.constraint(equalTo: appearedCustomNavigationBar.trailingAnchor, constant: -15 - Metrics.contentsLeadingTrailingOffset),
                navigationBarHeartButton.widthAnchor.constraint(equalToConstant: favoriteButton.bounds.width),
                navigationBarHeartButton.heightAnchor.constraint(equalTo: navigationBarHeartButton.widthAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                navigationBarSharedButton.centerYAnchor.constraint(equalTo: navigationBarBackButton.centerYAnchor),
                navigationBarSharedButton.trailingAnchor.constraint(equalTo: navigationBarHeartButton.leadingAnchor, constant: -15),
                navigationBarSharedButton.widthAnchor.constraint(equalToConstant: favoriteButton.bounds.width),
                navigationBarSharedButton.heightAnchor.constraint(equalTo: navigationBarSharedButton.widthAnchor)
            ]
        )
        // Label animation
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0) {
            navigationBarAnimationLabel.alpha = 1
            labelTopConstraint.constant = 50
            navigationBarAnimationLabel.layoutIfNeeded()
        }
    }
            
    // MARK: - Private Methods
    
    private func createButton(systemImageName: String = "eye") -> UIButton {
        let button = UIButton()
        let image = UIImage(systemName: systemImageName)?.withTintColor(.gray,
                                                                        renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.topAnchor.constraint(equalTo: button.topAnchor).isActive = true
        button.imageView?.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        button.imageView?.leadingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        button.imageView?.trailingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    
    private func addLabelToView(with textSize: CGFloat,
                                and textWeight: UIFont.Weight,
                                _ fontColor: UIColor = .black,
                                through numberLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = fontColor
        label.font = UIFont.systemFont(ofSize: textSize, weight: textWeight)
        label.numberOfLines = numberLines
        return label
    }
    
    private func addStackViewToView(with axis: NSLayoutConstraint.Axis,
                                    distribution: UIStackView.Distribution = .fill,
                                    spacing: CGFloat = 0,
                                    layoutMargins: UIEdgeInsets = .zero) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.spacing = spacing
        if layoutMargins != .zero {
            stackView.isLayoutMarginsRelativeArrangement = true
            stackView.layoutMargins = layoutMargins
        }
        return stackView
    }
    
    private func addContactButtons(with text: String,
                                   and color: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: Metrics.mainTextFontSize)
        button.tintColor = .white
        button.backgroundColor = color
        button.layer.masksToBounds = false
        button.layer.cornerRadius = Metrics.contactsButtonsRadiusCorner
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowRadius = 2
        button.layer.shadowOpacity = 0.5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}

// MARK: - Extensions

extension ItemPageView {
    enum Images {
        static let mappinImage = UIImage(systemName: "mappin")?.withTintColor(.lightGray,
                                                                                  renderingMode: .alwaysOriginal)
    }
    
    enum Metrics {
        static let screenWidth = UIScreen.main.bounds.width
        static let screenHeight = UIScreen.main.bounds.height
        
        static let logoImageViewLeadingOffset: CGFloat = 20
        
        static let labelOfImageCounterBottomOffset: CGFloat = -20
        static let labelOfImageCounterTrailingOffset: CGFloat = -26

        static let backButtonsDiameter: CGFloat = 35
        
        static let labelStackViewSpacingValue: CGFloat = 20
        
        static let titlesFontSize: CGFloat = 20
        static let contentsLeadingTrailingOffset: CGFloat = 15
        
        static let shortDescriptFontSize: CGFloat = 18
        static let buttonsCornerRadius: CGFloat = 16
        static let buttonMapBorderWidthValue: CGFloat = 0.5
        
        static let mainTextFontSize: CGFloat = 18
        
        static let mappinImageViewTopAnchorOffsetValue: CGFloat = 12
        
        static let contactsButtonGap: CGFloat = 16
        static let contactsStackViewBottomOffset: CGFloat = -45
        static let contactsButtonsRadiusCorner: CGFloat = 10
    }
    
    enum Strings {
        static let messageContactButtonLabelTitle = "Написать"
        static let callContactButtonLabelTitle = "Позвонить"
    }
}
