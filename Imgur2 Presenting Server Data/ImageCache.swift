//
//  ImageCache.swift
//  Imgur2 Presenting Server Data
//
//  Created by Lucas Caron Albarello on 31/12/2017.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import UIKit

let imageCache = ImageCache()
class ImageCache: NSCache<AnyObject, AnyObject>{
    func add(_ image: UIImage, forkey key: String){
        setObject(image, forKey: key as AnyObject)
    }
    
    func image(forkey key:String)-> UIImage?{
        guard let image = object(forKey: key as AnyObject) as? UIImage else {return nil}
        return image
    }
}
