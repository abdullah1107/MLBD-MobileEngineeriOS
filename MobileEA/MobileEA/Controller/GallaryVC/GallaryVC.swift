//
//  ViewController.swift
//  MobileEA
//  Created by Muhammad Abdullah Al Mamun on 26/12/21.
//

import UIKit

class GallaryVC: UIViewController {
    
    
    
    // MARK: - outlet
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
   
    
 
   
    
    // MARK: - variable
    var homeCV: UICollectionView!
    var homeTV:UITableView = UITableView()

    
    
    
    
    //MARK: - view didload
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("debug...")
    }
    
    
    
    // MARK: - view willAppear
    override func viewWillAppear(_ animated: Bool) {
        debugPrint("print...")
    }
    
    


}

