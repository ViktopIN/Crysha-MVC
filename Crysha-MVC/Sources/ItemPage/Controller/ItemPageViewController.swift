//
//  ItemPageViewController.swift
//  Crysha-MVC
//
//  Created by Виктор on 30.10.2022.
//

import UIKit

class ItemPageViewController: UIViewController {
    
    // MARK: - Properties
    
    var mainPageViewController: UIViewController = MainPageViewController()
    var viewItem: ItemPageView!
    var dataSource = MainModel.getModel()
    
    // MARK: - View
    
    private var itemPageView: ItemPageView? {
        guard isViewLoaded else { return nil }
        return (view as? ItemPageView)
    }
    
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
        navigationController?.navigationBar.isHidden = true
        navigationItem.setHidesBackButton(true, animated: false)
        tabBarController?.tabBar.isHidden = true
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Methods
    
    private func configureImageSwiper() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: generateLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageViewSwiperCell.self, forCellWithReuseIdentifier: ImageViewSwiperCell.reuseID)
        itemPageView?.imageViewSwiper = collectionView
        itemPageView?.configureImageSwiper()
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageViewSwiperCell.reuseID, for: indexPath) as! ImageViewSwiperCell
        cell.setCell(image: dataSource[0].mainThumbnail[indexPath.row])
        return cell
    }
    
    
}

