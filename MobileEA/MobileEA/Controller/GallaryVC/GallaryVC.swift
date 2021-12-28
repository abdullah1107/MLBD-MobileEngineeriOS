//
//  ViewController.swift
//  MobileEA
//  Created by Muhammad Abdullah Al Mamun on 26/12/21.
//

import UIKit

//MARK: - Selection Mode

enum Mode {
    case view
    case select
}




class GallaryVC: UIViewController {
    
    
    
    // MARK: - outlet
    @IBOutlet weak var listButton: UIButton!
    @IBOutlet weak var gridButton: UIButton!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
   
    
 
   
    
    // MARK: - variable
    var photoModel = [PhotoModel]()
    var homeCV: UICollectionView!
    var homeTV:UITableView = UITableView()
    var selectedImages:[UIImage] = []
    var selectedID = [String]()
    var collectedImages:[UIImage] = []
    
   
    var gridButtonClicked:Bool = true
    var listButtonClicked:Bool = false
    var dictionarySelectedIndecPath: [IndexPath: Bool] = [:]
    
    
    


    
    var mObject: Mode = .view {
        
        didSet {
            
            switch mObject {
                
            case .view:
                
                for (key, value) in dictionarySelectedIndecPath {
                    if value {
                        homeCV.deselectItem(at: key, animated: true)
                    }
                }
                
                dictionarySelectedIndecPath.removeAll()
                self.navigationItem.rightBarButtonItem!.title = "Select"
                homeCV.allowsMultipleSelection = false
                homeTV.allowsMultipleSelection = false
                
            case .select:
                
                homeCV.allowsMultipleSelection = true
                homeTV.allowsMultipleSelection = true
                
            }
        }
    }
   

    
    
    
    
    //MARK: - view didload
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Gallary"
        self.initVC()
        dataloadfromserver()
       
    }
    
    
    
    // MARK: - view willAppear
    override func viewWillAppear(_ animated: Bool) {
        debugPrint("print...")
    }
    
    
    
    
    
    // MARK: - listButton
    @IBAction func listButtonClicked(_ sender: UIButton) {
        self.isListReady()
        self.selectedID.removeAll()
        self.selectedImages.removeAll()
        DispatchQueue.main.async {
            self.mObject = .view
            self.homeCV.reloadData()
        }
    }
    
    
    
    
    
    
    // MARK: - gridButton
    @IBAction func gridButtonClicked(_ sender: UIButton) {
        self.isGridReady()
        self.selectedID.removeAll()
        self.selectedImages.removeAll()
        DispatchQueue.main.async {
            self.mObject = .view
            self.homeTV.reloadData()
        }
    }
    
    
    
    
    
    
    
    // MARK: - shareButton
    @IBAction func sharaButtonClicked(_ sender: UIBarButtonItem) {
        debugPrint(selectedImages.count)
        
        let shareVC = UIActivityViewController(activityItems: selectedImages, applicationActivities: nil)
        self.present(shareVC, animated: true, completion: nil)
        
//        if UIDevice.isPad {
//
//            shareVC.modalPresentationStyle = .overFullScreen
//            shareVC.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
//
//            if shareVC.responds(to: #selector(getter: UIViewController.popoverPresentationController)) {
//                shareVC.popoverPresentationController?.sourceView = self.view
//            }
//            self.present(shareVC, animated: true, completion: nil)
//        }
//        else if UIDevice.isPhone{
//            self.present(shareVC, animated: true, completion: nil)
//        }

    }
    
    


}

extension GallaryVC{
    
    func dataloadfromserver(){
        
        let utility = HttpUtility.shared // using the shared instance of the utility to make the API call
        let requestUrl = URL(string: ApiUrl.getallphotosGallary)
        let request = HURequest(withUrl: requestUrl!, forHttpMethod: .get)
        
        utility.request(huRequest: request, resultType: [PhotoModel].self) { [weak self] (response) in
            
            
            switch response{
                
            case .success(let employee):
                
                guard let employee = employee else {return}
                
                for emp in employee{
                    self?.photoModel.append(emp)
                }
                
                DispatchQueue.main.async {
                    self?.homeCV.reloadData()
                    self?.homeTV.reloadData()
                }
                
            case .failure(let error):
                debugPrint(error)
                
                // your code here to handle error
                
            }
        }
        
    }
    
}
