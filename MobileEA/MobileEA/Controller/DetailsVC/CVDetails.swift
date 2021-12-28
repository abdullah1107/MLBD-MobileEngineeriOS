//
//  CVDetails.swift
//  MobileEA
//
//  Created by Muhammad Abdullah Al Mamun on 28/12/21.
//

import Foundation
import UIKit
import SDWebImage


extension PagingCollectionViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // print("images.count", images.count)
        return currentDocuments.count

    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell: PagingCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier:"pagingImageCell", for: indexPath) as? PagingCollectionViewCell)!
        
        let targetSize = CGSize(width: 500, height: 1200)
        
        guard let url = URL(string: currentDocuments[indexPath.row].download_url ?? "") else { return cell }
        
        cell.imageView.sd_setImage(with: url, placeholderImage: UIImage(named: "default.png")?.sd_resizedImage(with: targetSize, scaleMode: .aspectFit))
        
//        let targetSize = CGSize(width: 500, height: 1000)
//        let data = try? Data(contentsOf: url)
//
//        if let imageData = data {
//            let image = UIImage(data: imageData)?.scalePreservingAspectRatio(targetSize: targetSize)
//            cell.image = image
//        }
        
        //cell.imageView.sd_setImage(with: url, placeholderImage: UIImage(named: "default.png")?.resized(toWidth: 400))
        
      
        
        cell.imageView.isHidden = hideCellImageViews
        
        return cell
    }
    
}



// MARK: - UICollectionViewDelegateFlowout
extension PagingCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return (collectionView.frame.size)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}



extension PagingCollectionViewController{
    
    func registerCV()  {
        self.collectionView.register(PagingCollectionViewCell.self, forCellWithReuseIdentifier: "pagingImageCell")
        
    }
    
    
    func setupCollectionView() {
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.alwaysBounceHorizontal = true
        collectionView.alwaysBounceVertical = false
        
        collectionView.contentSize = CGSize(width: view.frame.width * CGFloat(currentDocuments.count), height: 1.0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // set initial index at `startingIndex`
        collectionView.scrollToItem(at: IndexPath(item: startingIndex, section: 0), at: .centeredHorizontally, animated: false)
    }
    
}

