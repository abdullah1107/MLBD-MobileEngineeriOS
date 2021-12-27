//
//  FolderTableViewCell.swift
//  MobileEA
//  Created by Muhammad Abdullah Al Mamun on 26/12/21.
//

import UIKit


protocol CellDelegateTV: AnyObject{
    
    func optionButtonTV(index: Int)
}




// MARK: - Folder Table View Cell

class HomeTVCell: UITableViewCell {
    
    
    
    // MARK: - cell and nib identifier
    static let identifier = "homeTV"
    
    static func nib()->UINib{
        return UINib(nibName: "HomeTVCell",
                     bundle: nil)
    }
    
    
    
    
    
    
    // MARK: - Outlets
    @IBOutlet weak var docsAndFoldsImageView: LazyImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var optionButton: UIButton!
    @IBOutlet weak var selectIndicator: UIImageView!
    
    weak var cellDelegate: CellDelegateTV?
    
    
    
    
    // MARK: - Awake From Nib
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
  
    
    
    // MARK: - Set Selected
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        optionButton.isHidden = isSelected
        selectIndicator.isHidden = !isSelected
        selectIndicator.image = UIImage(systemName: "checkmark.circle.fill")
    }
    
    
    
    
    // MARK: - Cell Option Button Action
    
    @IBAction func optionButtonAction(_ sender: UIButton) {
        
        cellDelegate?.optionButtonTV(index: sender.tag)
    }
    
    
    
    
    
    // Inside UITableViewCell subclass
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        //contentView.layer.cornerRadius = 10
    }
    
}
