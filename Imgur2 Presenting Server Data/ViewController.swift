//
//  ViewController.swift
//  Imgur2 Presenting Server Data
//
//  Created by Lucas Caron Albarello on 30/12/2017.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionVC : UICollectionView!
    var imgurs = [Imgur]()
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingServices.shared.getImgurs { (response) in
            self.imgurs = response.imgurs
            self.collectionVC.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        imageCache.removeAllObjects()
    }


}

extension ViewController : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgurs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgurCell", for: indexPath) as? ImgurCell else {return UICollectionViewCell()}
        cell.configure(with: imgurs[indexPath.item])
        return cell
    }
}
