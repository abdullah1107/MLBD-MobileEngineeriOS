//
//  PagingCollectionViewController.swift
//  PhotoZoomAnimator
//
//  Created by Joshua on 8/6/19.
//  Copyright © 2019 JHC Dev. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "pagingImageCell"

protocol PagingCollectionViewControllerDelegate {
    func containerViewController(_ containerViewController: PagingCollectionViewController, indexDidChangeTo currentIndex: Int)
}


class PagingCollectionViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var startingIndex: Int = Int()
    var currentIndex:Int = Int()
    var hideCellImageViews = false
    
    var transitionController = ZoomTransitionController()
    
    // base view controller to get updated about changes in index
    var containerDelegate: PagingCollectionViewControllerDelegate?
    
    var currentDocuments = [PhotoModel]()
    var images = [UIImage]()
    var currentImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.images.removeAll()
//        self.images.append(currentImage)
        
        registerCV()
        currentIndex = startingIndex
        setupCollectionView()
        
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(userDidPanWith(gestureRecognizer:)))
        view.addGestureRecognizer(panGesture)
    }
    
    

    
}
    
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }


//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return images.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PagingCollectionViewCell
//
//       // cell.image = images[indexPath.item]
////        guard let url = URL(string: currentDocuments[indexPath.row].download_url ?? "") else { return cell }
////
////        //let targetSize = CGSize(width: 450, height: 800)
////
////        cell.imageView.sd_setImage(with: url, placeholderImage: UIImage(named: "default.png")?.resized(toWidth: 400))
//
//        cell.imageView.image = images[indexPath.row]
//
//        cell.imageView.isHidden = hideCellImageViews
//
//        return cell
//    }
    
    
    

extension PagingCollectionViewController{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var imageNumber = Float((scrollView.contentOffset.x - 0.5 * view.frame.width) / view.frame.width)
        imageNumber.round(.up)
        currentIndex = Int(imageNumber)
    }
    
    // change the base view controller's index, too
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        containerDelegate?.containerViewController(self, indexDidChangeTo: currentIndex)
        debugPrint(currentIndex)
    }
}
