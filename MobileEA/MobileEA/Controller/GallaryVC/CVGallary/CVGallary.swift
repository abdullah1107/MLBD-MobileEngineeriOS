//
//  CVGallary.swift
//  MobileEA
//
//  Created by Muhammad Abdullah Al Mamun on 26/12/21.
//

import Foundation
import UIKit
import SDWebImage


extension GallaryVC:UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,CellDelegateCV{
    
    
    
    func optionButtonCV(index: Int) {
        
        
    } // end of option section
    
    
    
    
    //MARK:-
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        debugPrint(photoModel.count)
        
        return photoModel.count
    }
    
    
    
    // MARK: - Cell For Item At
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = homeCV.dequeueReusableCell(withReuseIdentifier:HomeCVCell.identifier, for: indexPath) as! HomeCVCell

        
        guard let url = URL(string: photoModel[indexPath.row].download_url ?? "") else { return cell }
        
        cell.imageCell.sd_setImage(with: url, placeholderImage: UIImage(named: "default.png"))
        

        
        cell.cellDelegate = self
        
        
        return cell
    }
    
    
    
    
    //MARK: - collectionView diddeselectmethod
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        debugPrint("indexpath:", indexPath.row)
        
        
        
        
    }
    
    
    
    // MARK: - Did Deselect Item At
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print(#function, indexPath.row)
        
        
        
    }
    
    
    // MARK: - Collection View Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellsAcross:CGFloat = 3.0

        
        let spaceBetweenCells: CGFloat = 1
        let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
        
        return CGSize(width: dim, height: dim + 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    
    
    
    
    
    
    
    
    
    // MARK: - Collection View Layout
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //
    //
    //        if UIDevice.isPhone{
    //            let numberOfCellsInRow = 2
    //            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
    //            let totalSpace = flowLayout.sectionInset.left + flowLayout.sectionInset.right + (flowLayout.minimumInteritemSpacing * CGFloat(numberOfCellsInRow - 1))
    //
    //            let size = Int((homeCV.bounds.width - totalSpace) / CGFloat(numberOfCellsInRow))
    //           // debugPrint("size", size)
    //
    //            return CGSize(width: size, height: size)
    //        }
    //
    //
    //        if UIDevice.isPad {
    //            // Do something
    //            let numberOfCellsInRow = 4
    //            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
    //            let totalSpace = flowLayout.sectionInset.left + flowLayout.sectionInset.right + (flowLayout.minimumInteritemSpacing * CGFloat(numberOfCellsInRow - 1))
    //
    //            let size = Int((homeCV.bounds.width - totalSpace) / CGFloat(numberOfCellsInRow))
    //            //debugPrint("size", size)
    //
    //            return CGSize(width: size, height: size)
    //        }
    //
    //
    //        return CGSize()
    //    }
    
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        //debugPrint("calling...")
    //
    //        if UIDevice.isPhone{
    //            return 20.0
    //        }
    //        if UIDevice.isPad{
    //            return 40
    //        }
    //
    //
    //        return CGFloat()
    //
    //    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //
    //        let numberOfCellsInRow = 2
    //        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
    //        let totalSpace = flowLayout.sectionInset.left + flowLayout.sectionInset.right + (flowLayout.minimumInteritemSpacing * CGFloat(numberOfCellsInRow - 1))
    //
    //        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numberOfCellsInRow))
    //        //debugPrint("size", size)
    //
    //        return CGSize(width: size, height: size + 15)
    //    }
    //
    //    //MARK:-
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        debugPrint("calling...")
    //        return 20.0
    //    }
    
    
    
    
    
    
    
}


































// MARK: - CollectionView ReusableView like tableVIew header


//        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
//
//            let header = homeCV.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
//
//            header.configure()
//            return header
//        }
//




//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        let size = CGSize(width: collectionView.bounds.width, height: 50)
//        return size
//    }





//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//        debugPrint("inside headerview")
//
//        if kind == UICollectionView.elementKindSectionHeader{
//
//
//
//            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:HomeCRV.identifier, for: indexPath) as! HomeCRV
//
//            header.homeVC = self
//
//            return header
//
//        }
//
//        return UICollectionReusableView()
//    }
