//
//  GetImgurs.swift
//  Imgur2 Presenting Server Data
//
//  Created by Lucas Caron Albarello on 31/12/2017.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import Foundation

struct GetImgursResponse{
    let imgurs : [Imgur]
    init(json: JSON) throws {
        guard let data = json["data"] as? [JSON] else {throw MyError.someError}
        let imgurs = data.map{Imgur(json: $0)}.flatMap{$0}
        self.imgurs = imgurs
    }
}
