//
//  Imgur.swift
//  Imgur2 Presenting Server Data
//
//  Created by Lucas Caron Albarello on 31/12/2017.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import UIKit

struct Imgur {
    private let link : String
    private let id : String
    let title: String
    init?(json: JSON){
        guard let id = json["id"] as? String,
        let title = json["title"] as? String,
        let link = json["link"] as? String else {return nil}
    self.id = id
    self.link = link
    self.title = title
    }
    func image(completion: @escaping (UIImage)-> Void){
        if let image = imageCache.image(forkey: id){
            completion(image)
        }else {
        NetworkingServices.shared.downloadImages(fromLink: link) { (image) in
            imageCache.add(image, forkey: self.id)
            completion(image)
            }
        }
    }
}
