//
//  ViewController.swift
//  Crysha-MVC
//
//  Created by Виктор on 17.10.2022.
//

import UIKit

class MainPageViewController: UIViewController {
    
    // MARK: - Views -
    
    var collectionView: UICollectionView! = nil
    
    // MARK: - Initialisation -

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Settings -
    
    private func configure() {
        let collectionView = UICollectionView(frame: view.frame,
                                              collectionViewLayout: getLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TableCollectionViewCell.self,
                                 forCellWithReuseIdentifier: TableCollectionViewCell.reuseID)
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

                let section = NSCollectionLayoutSection(group: group)
                return section
            }
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1/7))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalHeight(3/8))

            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        return layout
    }
}

// MARK: - Extension Datasource

extension MainPageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCollectionViewCell.reuseID,
                                                          for: indexPath) as! TableCollectionViewCell
            cell.getModelToCell(this: TableCellModel.getModels()[indexPath.row])
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCollectionViewCell.reuseID,
                                                      for: indexPath) as! TableCollectionViewCell
        cell.getModelToCell(this: TableCellModel.getModels()[indexPath.section])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return TableCellModel.getModels().count
        }
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}

