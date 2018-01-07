//
//  ImgurCell.swift
//  Imgur2 Presenting Server Data
//
//  Created by Lucas Caron Albarello on 31/12/2017.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import UIKit

class ImgurCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func configure(with imgur: Imgur){
        title.text = imgur.title
        imgur.image { (image) in
            self.image.image = image
        }
    }
    override func prepareForReuse() {
        title.text = nil
        image.image = nil
    }
}
