//
//  ImageExtension.swift
//  MobileEA
//
//  Created by Muhammad Abdullah Al Mamun on 27/12/21.
//

import Foundation
import UIKit

class LazyImageView: UIImageView
{
    
    private let imageCache = NSCache<AnyObject, UIImage>()
    
    func loadImage(fromURL imageURL: URL, placeHolderImage: String)
    {
        self.image = UIImage(named: placeHolderImage)
        
        if let cachedImage = self.imageCache.object(forKey: imageURL as AnyObject)
        {
            debugPrint("image loaded from cache for =\(imageURL)")
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global().async {
            [weak self] in
            
            if let imageData = try? Data(contentsOf: imageURL)
            {
                debugPrint("image downloaded from server...")
                if let image = UIImage(data: imageData)
                {
                    let targetSize = CGSize(width: 400, height: 400)
                    let scaledImage = image.scalePreservingAspectRatio(targetSize: targetSize)

                    DispatchQueue.main.async {
                       
                        self?.imageCache.setObject(scaledImage, forKey: imageURL as AnyObject)
                        self?.image = scaledImage
                    }
                }
            }
        }
    }
}

extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
}


extension UIImage {

    public static func loadFrom(url: URL, completion: @escaping (_ image: UIImage?) -> ()) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

}
