//
//  FlickrSearchCollectionViewCell.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 14/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

class FlickrSearchCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage? {
        didSet {
            // We know that it will be call from main thread.
            self.imageView.image = self.image
        }
    }
}
