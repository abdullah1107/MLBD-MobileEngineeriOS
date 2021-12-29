//
//  ViewController.swift
//  ImageViewer
//
//  Created by SHUBHAM AGARWAL on 17/08/19.
//  Copyright © 2019 SHUBHAM AGARWAL. All rights reserved.
//

import UIKit

class ImageScrollingVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    var currentImages = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = currentImages
        scrollView.maximumZoomScale = 4
        scrollView.minimumZoomScale = 1
        
        scrollView.delegate = self
    }
    
    
    @IBAction func saveGallary(_ sender: UIBarButtonItem) {
        
        debugPrint("save gallary")
       // UIImageWriteToSavedPhotosAlbum(currentImages, nil, nil, nil)
        UIImageWriteToSavedPhotosAlbum(self.currentImages, self, #selector(imageSave(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func imageSave(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {

        if let error = error {

            print(error.localizedDescription)

        } else {

            print("Success")
           // showMessageToUser(title: "Alert", msg: "Documents saved")
        }
    }
}

extension ImageScrollingVC: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView.zoomScale > 1 {
            if let image = imageView.image {
                let ratioW = imageView.frame.width / image.size.width
                let ratioH = imageView.frame.height / image.size.height
                
                let ratio = ratioW < ratioH ? ratioW : ratioH
                let newWidth = image.size.width * ratio
                let newHeight = image.size.height * ratio
                let conditionLeft = newWidth*scrollView.zoomScale > imageView.frame.width
                let left = 0.5 * (conditionLeft ? newWidth - imageView.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
                let conditioTop = newHeight*scrollView.zoomScale > imageView.frame.height
                
                let top = 0.5 * (conditioTop ? newHeight - imageView.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
                
                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
                
            }
        } else {
            scrollView.contentInset = .zero
        }
    }
}
