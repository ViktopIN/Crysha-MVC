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
    var mainPageViewController: UIViewController!
    
    // MARK: - Views
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(Images.backButtonImage, for: .normal)
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
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var imageViewSwiper: UICollectionView!
    
    // MARK: - Initialiser
    
    init(frame: CGRect, controller: ItemPageViewControllerProtocol) {
        super.init(frame: .zero)
        self.controller = controller
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        addSubview(scrollView)
        addSubview(backButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                backButton.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                backButton.heightAnchor.constraint(equalToConstant: Metrics.backButtonsDiameter),
                backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor)
            ]
        )
        NSLayoutConstraint.activate(
            [
                scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
                scrollView.topAnchor.constraint(equalTo: topAnchor),
                scrollView.heightAnchor.constraint(equalTo: heightAnchor)
            ]
        )
    }
    
    private func setupView() {
        backgroundColor = .white
    }
    
    // MARK: - Methods
    
    @objc func goBack() {
        controller.goBack()
    }
    
    func configureImageSwiper() {
        scrollView.addSubview(imageViewSwiper)
        NSLayoutConstraint.activate(
            [
                imageViewSwiper.topAnchor.constraint(equalTo: topAnchor),
                imageViewSwiper.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                imageViewSwiper.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                imageViewSwiper.heightAnchor.constraint(equalTo: scrollView.widthAnchor)
            ]
        )
    }
}

// MARK: - Extensions

extension ItemPageView: ItemPageViewProtocol {

}

extension ItemPageView {
    enum Images {
        static let backButtonImage = UIImage(systemName: "arrow.backward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    }
    
    enum Metrics {
        static let backButtonsDiameter: CGFloat = 35
    }
}
