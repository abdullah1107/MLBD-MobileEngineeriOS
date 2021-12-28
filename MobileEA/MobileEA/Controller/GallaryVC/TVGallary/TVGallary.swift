//
//  TVGallary.swift
//  MobileEA
//
//  Created by Muhammad Abdullah Al Mamun on 26/12/21.
//

import Foundation
import UIKit



extension GallaryVC: UITableViewDelegate, UITableViewDataSource, CellDelegateTV {
    
    
    
    // MARK: - TV Cell Option Button
    func optionButtonTV(index: Int) {
        
        
    }
    
    
    
    
    // MARK: - Number Of Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - Number Of Rows In Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return photoModel.count
    }
    
    
    
    
    
    
    
    
    // MARK: - Cell For Row At
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = homeTV.dequeueReusableCell(withIdentifier: HomeTVCell.identifier, for: indexPath) as! HomeTVCell
        
        //        guard let url = URL(string: photoModel[indexPath.row].download_url ?? "") else { return cell }
        //
        //        // MARK: - NSCache
        //        cell.docsAndFoldsImageView.loadImage(fromURL: url , placeHolderImage: "default")
        
        
        guard let url = URL(string: photoModel[indexPath.row].download_url ?? "") else { return cell }
        
        cell.docsAndFoldsImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "default.png"))
        
        cell.nameLabel.text = photoModel[indexPath.row].author ?? ""
        
        cell.numberOfItemsLabel.text = photoModel[indexPath.row].download_url ?? ""
        
        cell.cellDelegate = self
        
        
        
        
        return cell
    }
    
    
    
    
    
    // MARK: - Height For Row At
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
    
    // MARK: - Height For Header In Section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
    // MARK: - View For Header In Section
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
    
    
    
    
    // MARK: - Did Select Row At
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath.row)
        
        let cell = tableView.cellForRow(at: indexPath) as! HomeTVCell
        
        
        
        switch mObject{
        case .view:
            cell.selectIndicator.isHidden = true
          
//            
//            if let destinationViewController = self.storyboard?.instantiateViewController(withIdentifier: "ImageScrollingVC") as? ImageScrollingVC {
//                destinationViewController.currentImages = cell.docsAndFoldsImageView.image ?? UIImage()
//                
//                self.navigationController?.pushViewController(destinationViewController, animated: true)
//            }
            
            
            if let destinationViewController = self.storyboard?.instantiateViewController(withIdentifier: "PagingCollectionViewController") as? PagingCollectionViewController {

                destinationViewController.currentDocuments = photoModel


                destinationViewController.startingIndex = indexPath.row

                self.navigationController?.pushViewController(destinationViewController, animated: true)
            }

            
            
        case .select:
            
            dictionarySelectedIndecPath[indexPath] = true
            selectedID.append(self.photoModel[indexPath.row].id ?? String() )
            let targetSize = CGSize(width: 400, height: 400)
            self.selectedImages.append(cell.docsAndFoldsImageView.image?.scalePreservingAspectRatio(targetSize: targetSize) ?? UIImage())
            
        }
        
        
        
    }
    
    
    
    // MARK: - Did Deselect Row At
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        print(#function, indexPath.row)
        switch mObject{
        case .view:
            break
            
        case .select:
            
            if self.homeTV.allowsMultipleSelection{
                
                dictionarySelectedIndecPath[indexPath] = false
                self.selectedID.removeAll(where: { $0 == self.photoModel[indexPath.row].id })
                self.selectedImages.removeLast()
                
                
            }
        } // end selected object
        
        
        
    }
    
}
