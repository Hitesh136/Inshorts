//
//  CardLayout.swift
//  inShorts
//
//  Created by Hitesh Agarwal on 11/03/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import UIKit

class CardLayout: UICollectionViewFlowLayout {
    
    var cache = [UICollectionViewLayoutAttributes]()
    var panGesture: UIPanGestureRecognizer? = nil
    var maxYOffSet: CGFloat = 0.3
    var animationTimeDuration: TimeInterval = 0.3
    
    func topCell() -> UICollectionViewCell? {
        let items = collectionView?.numberOfItems(inSection: 0) ?? 0
        
        if items >= 1 {
            return collectionView?.cellForItem(at: IndexPath(item: 0, section: 0))
        } else {
            return nil
        }
    }
    
    func bottomCell() -> UICollectionViewCell? {
        let items = collectionView?.numberOfItems(inSection: 0) ?? 0
        if items >= 2 {
            return collectionView?.cellForItem(at: IndexPath(item: 1, section: 0))
        } else {
            return nil
        }
    }
    
    override func prepare() {
        super.prepare()
        
        let items = collectionView?.numberOfItems(inSection: 0) ?? 0
        for item in 0..<items {
            let layoutElement = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: item, section: 0))
            layoutElement.frame = collectionView!.bounds
            
            if item == 0 {
                layoutElement.alpha = 1
            } else {
                layoutElement.alpha = 0
            }
            layoutElement.zIndex = items - item
            cache.append(layoutElement)
        }
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(panGesture:)))
        collectionView?.addGestureRecognizer(panGesture!)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for layoutAttribute in cache {
            if layoutAttribute.frame.intersects(rect) {
                layoutAttributes.append(layoutAttribute)
            }
        }
        return layoutAttributes
    }
    
    @objc func handlePanGesture(panGesture: UIPanGestureRecognizer) {
        let yOffSet = panGesture.translation(in: collectionView).y
        let maxYOffSet = collectionView!.frame.height * self.maxYOffSet
        
        switch panGesture.state {
        case .began, .changed:
            if let topCell = topCell() {
                moveCell(cell: topCell, yOffSet: yOffSet)
            }
            
            if let bottomCell = bottomCell() {
                bottomCell.alpha = 1
                //Animatically show bottomCell
            }
        case .ended:
            if yOffSet > maxYOffSet {
                //Remove top cell
            } else {
                if let topCell = topCell() {
                    resetCellPosition(cell: topCell)
                }
                //Move back top cell to top
            }
        default:
            break
        }
    }
    
    func resetCellPosition(cell: UICollectionViewCell) {
        let animator = UIViewPropertyAnimator(duration: animationTimeDuration, curve: .easeOut) {
            cell.transform = CGAffineTransform(translationX: 1, y: 1)
        }
        animator.startAnimation()
    }
    
    func moveCell(cell: UICollectionViewCell, yOffSet: CGFloat) {
        cell.transform = CGAffineTransform(translationX: 0, y: yOffSet)
    }
    
    func animatedAppear(cell: UICollectionViewCell) {
//        cell.transform = CGAffineTransform(translationX: <#T##CGFloat#>, y: <#T##CGFloat#>)
    }
}
