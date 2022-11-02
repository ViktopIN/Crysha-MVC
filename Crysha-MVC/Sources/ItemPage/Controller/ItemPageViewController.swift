//
//  ItemPageViewController.swift
//  Crysha-MVC
//
//  Created by Виктор on 30.10.2022.
//

import UIKit

class ItemPageViewController: UIViewController {
    
    // MARK: - Properties
    
    enum Supplementary {
        static let logo = "logoReusableView"
        static let counter = "imageCounterReusableView"
        static let panel = "sharedAndFavoritesPanelReusableView"
    }
    var mainPageViewController: UIViewController = MainPageViewController()
    var viewItem: ItemPageView!
    private var dataSource = MainModel.getModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {
        DispatchQueue.main.async {
            self.configureImageSwiper()
        }
    }
    
    private func setupView() {
        view = viewItem
    }
    
    // MARK: - Methods
    
    private func configureImageSwiper() {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: generateLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageViewSwiperCell.self,
                                forCellWithReuseIdentifier: ImageViewSwiperCell.reuseID)
        collectionView.register(LogoReusableView.self,
                                forSupplementaryViewOfKind: Supplementary.logo,
                                withReuseIdentifier: LogoReusableView.reuseID)
        collectionView.register(ImageCounterReusableView.self,
                                forSupplementaryViewOfKind: Supplementary.counter,
                                withReuseIdentifier: ImageCounterReusableView.reuseID)
        collectionView.register(SharedAndFavoritesPanelReusableView.self,
                                forSupplementaryViewOfKind: Supplementary.panel,
                                withReuseIdentifier: SharedAndFavoritesPanelReusableView.reuseID)
        viewItem.imageViewSwiper = collectionView
        viewItem.configureImageSwiper()
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let counterAnchor = NSCollectionLayoutAnchor(edges: [.trailing, .bottom],
                                                     fractionalOffset: CGPoint(x: -0.5, y: -0.5))
        let counterSize = NSCollectionLayoutSize(widthDimension: .absolute(40),
                                                 heightDimension: .absolute(24))
        let counter = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: counterSize,
                                                                  elementKind: Supplementary.counter,
                                                                  containerAnchor: counterAnchor)
        let logoAnchor = NSCollectionLayoutAnchor(edges: [.leading, .bottom],
                                                  fractionalOffset: CGPoint(x: 0.25, y: 0.5))
        let logoSize = NSCollectionLayoutSize(widthDimension: .absolute(80),
                                              heightDimension: .absolute(80))
        let logo = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: logoSize,
                                                               elementKind: Supplementary.logo,
                                                               containerAnchor: logoAnchor)
        let panelSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .absolute(60))
        let panel = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: panelSize,
                                                                elementKind: Supplementary.panel,
                                                                alignment: .bottom)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [counter, logo, panel]
        section.orthogonalScrollingBehavior = .groupPaging
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

// MARK: - Extensions

extension ItemPageViewController: ItemPageViewControllerProtocol {
    
    func goBack() {
        navigationController?.popToViewController(mainPageViewController, animated: true)
    }
}

extension ItemPageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[0].mainThumbnail.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageViewSwiperCell.reuseID,
                                                      for: indexPath) as! ImageViewSwiperCell
        cell.setCell(image: dataSource[0].mainThumbnail[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == ImageCounterReusableView.reuseID {
            let supplementaryElement = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                       withReuseIdentifier: ImageCounterReusableView.reuseID,
                                                                                       for: indexPath) as! ImageCounterReusableView
            DispatchQueue.main.async {
                supplementaryElement.configure(labelText: "\(indexPath.row + 1)/\(indexPath.count + 1)")
            }
            return supplementaryElement
        }
        else if kind == SharedAndFavoritesPanelReusableView.reuseID {
            let supplementaryElement = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                       withReuseIdentifier: SharedAndFavoritesPanelReusableView.reuseID,
                                                                                       for: indexPath) as! SharedAndFavoritesPanelReusableView
            return supplementaryElement
        }
        
        let supplementaryElement = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                   withReuseIdentifier: LogoReusableView.reuseID,
                                                                                   for: indexPath) as! LogoReusableView
        return supplementaryElement
    }
}

