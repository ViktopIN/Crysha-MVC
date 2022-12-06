//
//  ItemPageCollectionViewCompositionalLayout.swift
//  Crysha-MVC
//
//  Created by Виктор on 20.11.2022.
//

import UIKit

class ItemPageCollectionViewCompositionalLayout: UICollectionViewCompositionalLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        layoutAttributes?.forEach({ attributes in
            if attributes.representedElementCategory == .cell {
                guard let collectionView = collectionView else { return }
                let xPoint = CGFloat(0 + attributes.indexPath.row * Int(collectionView.bounds.maxX))
                let width = collectionView.bounds.width
                let contentOffset = collectionView.contentOffset.y
                print(contentOffset)
                if contentOffset > 0 {
                    return
                }
                let height = collectionView.bounds.height - contentOffset
                attributes.frame = CGRect(x: xPoint, y: contentOffset, width: width, height: height - 60)
            }
        })
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
