//
//  Extensions.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 03/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit
let imageCache = NSCache<NSString, UIImage>()
extension UIImageView{
    func loadImageUsingCacheWithUrlString(urlString: String){
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString){
            self.image = cachedImage
            return
        }
        
        let url =  URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: {(data,response,error) in
            if error != nil{
                print(error)
                return
            }
            DispatchQueue.main.async {
                if  let downloadedImage = UIImage(data: data!){
                    imageCache.setObject(downloadedImage,forKey: urlString as NSString)
                    self.image = downloadedImage
                }
                
            }
            
        }).resume()
    }
}
