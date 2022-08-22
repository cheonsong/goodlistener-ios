//
//  CustomViewFlowLayout.swift
//  GoodListener
//
//  Created by Jiyoung Park on 2022/08/22.
//

import UIKit

class CustomViewFlowLayout: UICollectionViewFlowLayout {
        let cellSpacing: CGFloat = 20

        override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
            self.minimumLineSpacing = 10.0
            self.sectionInset = UIEdgeInsets(top: 12.0, left: 10, bottom: 0.0, right: 10)
            let attributes = super.layoutAttributesForElements(in: rect)

            var leftMargin = sectionInset.left
            var maxY: CGFloat = -1.0
            attributes?.forEach { layoutAttribute in
                if layoutAttribute.frame.origin.y >= maxY {
                    leftMargin = sectionInset.left
                }
                layoutAttribute.frame.origin.x = leftMargin
                leftMargin += layoutAttribute.frame.width + cellSpacing
                maxY = max(layoutAttribute.frame.maxY, maxY)
            }
            return attributes
        }
}
