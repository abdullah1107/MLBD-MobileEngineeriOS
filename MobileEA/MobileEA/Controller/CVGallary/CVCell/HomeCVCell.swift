
// HomeCVCell.swift
//  MobileEA
//  Created by Muhammad Abdullah Al Mamun on 26/12/21.


import UIKit


protocol CellDelegateCV: AnyObject{
    
    func optionButtonCV(index: Int)
}


class HomeCVCell: UICollectionViewCell {
    
    weak var cellDelegate: CellDelegateCV?
    
    // MARK: - cell and nib identifier
    static let identifier = "homeCVCell"
    
    static func nib()->UINib{
        return UINib(nibName: "HomeCVCell",
                     bundle: nil)
    }
    
    
    // MARK: - outlet
    
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var selectIndicator: UIImageView!
    
    
    
    // MARK: - Main method
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    
    
    
    
    // MARK: - Is Selected
    override var isSelected: Bool {
        didSet {
            
            selectIndicator.isHidden = !isSelected
            selectIndicator.image = UIImage(systemName: "checkmark.circle.fill")
            
        }
    }
    
    
    
    
    
    
    
    // MARK: - Option Button
    @IBAction func threedotButtonAction(_ sender: UIButton) {
        
        cellDelegate?.optionButtonCV(index: sender.tag)
    }
    
}





