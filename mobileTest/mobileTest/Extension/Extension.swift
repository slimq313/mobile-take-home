//
//  Extension.swift
//  mobileTest
//
//  Created by CtanLI on 2019-07-04.
//  Copyright © 2019 guestlogix. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    func loadImageUsingCacheWithURLString(urlString: String) {
        if urlString == "" {
            return
        }
        self.image = nil
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                print(error ?? "")
                return
            }
            DispatchQueue.main.async {
                if let downloadedImages = UIImage(data: data!) {
                    imageCache.setObject(downloadedImages, forKey: urlString as NSString)
                    self.image = downloadedImages
                }
            }
        }).resume()
    }
}
