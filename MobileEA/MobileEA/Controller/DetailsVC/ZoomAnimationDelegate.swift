//
//  ZoomAnimationDelegate.swift
//  iScanner
//
//  Created by Muhammad Abdullah Al Mamun on 21/10/21.
//

import Foundation
import UIKit


// MARK: - ZoomAnimatorDelegate
extension PagingCollectionViewController: ZoomAnimatorDelegate {
    func transitionWillStartWith(zoomAnimator: ZoomAnimator) {
        // add code here to be run just before the transition animation
        hideCellImageViews = zoomAnimator.isPresenting
    }
    
    func transitionDidEndWith(zoomAnimator: ZoomAnimator) {
        // add code here to be run just after the transition animation
        hideCellImageViews = false
        if let cell = collectionView.cellForItem(at: IndexPath(item: currentIndex, section: 0)) as? PagingCollectionViewCell {
            cell.imageView.isHidden = hideCellImageViews
        }
    }
    
    func referenceImageView(for zoomAnimator: ZoomAnimator) -> UIImageView? {
        if let cell = collectionView.cellForItem(at: IndexPath(item: currentIndex, section: 0)) as? PagingCollectionViewCell {
            return cell.imageView
        }
        return nil
    }
    
    func referenceImageViewFrameInTransitioningView(for zoomAnimator: ZoomAnimator) -> CGRect? {
        if let cell = collectionView.cellForItem(at: IndexPath(item: currentIndex, section: 0)) as? PagingCollectionViewCell {
            return cell.scrollView.convert(cell.imageView.frame, to: view)
        }
        return nil
    }
    
    
}



// MARK: - handle pan gesture
extension PagingCollectionViewController {
    
    @objc func userDidPanWith(gestureRecognizer: UIPanGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
            transitionController.isInteractive = true
            let _ = navigationController?.popViewController(animated: true)
        case .ended:
            if transitionController.isInteractive {
                transitionController.isInteractive = false
                transitionController.didPanWith(gestureRecognizer: gestureRecognizer)
            }
        default:
            if transitionController.isInteractive {
                transitionController.didPanWith(gestureRecognizer: gestureRecognizer)
            }
        }
    }
}

