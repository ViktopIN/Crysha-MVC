//
//  ViewController.swift
//  Crysha-MVC
//
//  Created by Виктор on 17.10.2022.
//

import UIKit

class MainPageViewController: UIViewController {
    
    // MARK: - Properties -
    
    static let sectionHeaderElementKind = "section-header-element-kind"
    var itemPageViewController: UIViewController!
    
    // MARK: - Views -
    
    var collectionView: UICollectionView! = nil
    
    // MARK: - Initialisation -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupHierarchy()
        setupLayout()
        configureNavigationController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Settings -
    
    private func configureNavigationController() {
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButton

    }
    
    private func configureCollectionView() {
        let collectionView = UICollectionView(frame: view.frame,
                                              collectionViewLayout: getLayout())
        collectionView.backgroundColor = UIColor(named: "headerColor")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TableCollectionViewCell.self,
                                 forCellWithReuseIdentifier: TableCollectionViewCell.reuseID)
        collectionView.register(MainCollectionViewCell.self,
                                 forCellWithReuseIdentifier: MainCollectionViewCell.reuseID)
        collectionView.register(BottomCollecionViewHeader.self,
                                forSupplementaryViewOfKind: MainPageViewController.sectionHeaderElementKind,
                                withReuseIdentifier: BottomCollecionViewHeader.reuseID)
        self.collectionView = collectionView
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        )
    }
    
    // MARK: - Methods -
    
    private func getLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { indexSection, environment ->
            NSCollectionLayoutSection? in
            if indexSection == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1/7))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .fractionalHeight(3/7))

                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                              leading: 0,
                                                              bottom: 6,
                                                              trailing: 0)

                let section = NSCollectionLayoutSection(group: group)
                return section
            }
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalWidth(5/8))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 6,
                                                         leading: 0,
                                                         bottom: 6,
                                                         trailing: 0)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalWidth(15/8))
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                    heightDimension: .absolute(48))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: MainPageViewController.sectionHeaderElementKind,
                alignment: .top)

            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [sectionHeader]

            return section
        }
        return layout
    }
}

// MARK: - Extension Datasource and Delegate

extension MainPageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCollectionViewCell.reuseID,
                                                          for: indexPath) as! TableCollectionViewCell
            cell.takeModelToCell(this: TableCellModel.getModels()[indexPath.row])
            if indexPath.row == TableCellModel.getModels().count - 1 {
                cell.layer.masksToBounds = false
                cell.layer.shadowRadius = 3
                cell.layer.shadowColor = UIColor.lightGray.cgColor
                cell.layer.shadowOpacity = 0.8
                cell.layer.shadowOffset = .zero
                cell.layer.shouldRasterize = true
                cell.layer.rasterizationScale = UIScreen.main.scale
                let shadowPath = UIBezierPath(rect: CGRect(x: 0,
                                                           y: cell.bounds.maxY - cell.layer.shadowRadius ,
                                                           width: cell.bounds.width,
                                                           height: cell.layer.shadowRadius))
                shadowPath.lineWidth = 3
                cell.layer.shadowPath = shadowPath.cgPath
            }
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.reuseID,
                                                      for: indexPath) as! MainCollectionViewCell
        cell.layer.masksToBounds = false
        cell.layer.shadowRadius = 3
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOpacity = 0.8
        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = .zero
        cell.takeModelToCell(this: MainModel.getModel()[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                    withReuseIdentifier: BottomCollecionViewHeader.reuseID,
                                                                                    for: indexPath) as? BottomCollecionViewHeader else { fatalError() }
        return supplementaryView
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return TableCellModel.getModels().count
        }
        return MainModel.getModel().count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}

extension MainPageViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            navigationController?.pushViewController(itemPageViewController, animated: true)
            
        }
    }
}


