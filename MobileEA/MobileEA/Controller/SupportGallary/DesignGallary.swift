//
//  DesignGallary.swift
//  MobileEA
//
//  Created by Muhammad Abdullah Al Mamun on 26/12/21.
//

import Foundation
import UIKit


extension GallaryVC{
    
    // MARK: - setup collectionView
    func setupGallaryCV(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        self.homeCV = UICollectionView(frame: CGRect(x:0, y: 0, width: view.frame.width, height: view.frame.height - 80), collectionViewLayout: layout)
        
        self.homeCV.register(HomeCVCell.nib(), forCellWithReuseIdentifier: HomeCVCell.identifier)
        
        //homeCV.dataSource = self
        //homeCV.delegate = self
        
        self.homeCV.showsVerticalScrollIndicator = false
        
        self.homeCV.allowsMultipleSelection = false
        
        self.view.addSubview(self.homeCV)
        self.view.sendSubviewToBack(self.homeCV)
    }
    
    
    
    
    
    
    
    
    
    
    // MARK: - setup TableView
    func setupGallaryTV(){
        self.homeTV.register(HomeTVCell.nib(), forCellReuseIdentifier: HomeTVCell.identifier)
        
        
        
        self.homeTV.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        self.homeTV.dataSource = self
        self.homeTV.delegate = self
        
        self.homeTV.showsVerticalScrollIndicator = false
        
        self.homeTV.allowsMultipleSelectionDuringEditing = true
        
        self.homeTV.tableFooterView = UIView(frame: CGRect.zero)
        //self.homeTV.sectionHeaderHeight = 15.0
        self.homeTV.sectionFooterHeight = 0.0
        if #available(iOS 15.0, *) {
            self.homeTV.sectionHeaderTopPadding = 0
        }
        // self.homeTV.frame = view.bounds
        // self.homeTV = UITableView(frame: .zero, style: .insetGrouped)
        
        self.view.addSubview(self.homeTV)
        self.view.sendSubviewToBack(self.homeTV)
    }
}
