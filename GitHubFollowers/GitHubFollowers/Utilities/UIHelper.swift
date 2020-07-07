//
//  UIHelper.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 7/5/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import UIKit

enum UIHelper {
    
    // N Columns has to be at least 2 columns
    static func createNColumnFlowLayout(in view: UIView, columns: Int) -> UICollectionViewFlowLayout{
        guard columns >= 2 else {
            return UICollectionViewFlowLayout()
        }
        let spacesBetweenCells:CGFloat  = CGFloat(columns - 1)
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let spaceBetweenCells           = minimumItemSpacing * spacesBetweenCells
        let spaceOnEnds                 = padding * 2
        let availableWidth              = width - spaceOnEnds - spaceBetweenCells
        let itemWidth                   = availableWidth / CGFloat(columns)
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}
