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
        
        let cell = homeCV.cellForItem(at: indexPath) as? HomeCVCell
        
        switch mObject{
        
        case .view:
            
            cell?.selectIndicator.isHidden = true
        
            if let destinationViewController = self.storyboard?.instantiateViewController(withIdentifier: "ImageScrollingVC") as? ImageScrollingVC {
                destinationViewController.currentImages = cell?.imageCell.image ?? UIImage()
                
                self.navigationController?.pushViewController(destinationViewController, animated: true)
            }
            
            
           
        case .select:
            
            dictionarySelectedIndecPath[indexPath] = true
            let targetSize = CGSize(width: 450, height: 450)
            self.selectedImages.append(cell?.imageCell.image?.scalePreservingAspectRatio(targetSize: targetSize) ?? UIImage())
           
            
        }
        
        
        
        
        
        
    }
    
    
    
    // MARK: - Did Deselect Item At
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print(#function, indexPath.row)
      
        switch mObject{
        case .view:
            break
            
        case .select:
            
            if self.homeCV.allowsMultipleSelection{
                
                dictionarySelectedIndecPath[indexPath] = false
                self.selectedID.removeAll(where: { $0 == self.photoModel[indexPath.row].id })
                self.selectedImages.removeLast()
                
                
            }
        } // end selected object
        
        
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
