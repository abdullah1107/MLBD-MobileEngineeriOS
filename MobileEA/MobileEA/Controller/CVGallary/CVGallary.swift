//
//  CVGallary.swift
//  MobileEA
//
//  Created by Muhammad Abdullah Al Mamun on 26/12/21.
//

import Foundation
import UIKit


extension GallaryVC:UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,CellDelegateCV{
    
    
    
    func optionButtonCV(index: Int) {
        
        
    } // end of option section
    
    
    
    
    //MARK:-
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return 10
    }
    
    
    
    // MARK: - Cell For Item At
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = homeCV.dequeueReusableCell(withReuseIdentifier:HomeCVCell.identifier, for: indexPath) as! HomeCVCell
        
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
