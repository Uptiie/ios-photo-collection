//
//  PhotoCollectionViewCell.swift
//  Photo App
//
//  Created by Uptiie on 7/25/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo?{ didSet {updateViews()}}
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var imageNameLabel: UILabel!
    
    func updateViews() {
        guard let photo = photo else { return }
        photoImageView.image = UIImage(data: photo.imageData)
        imageNameLabel.text = photo.title
        
    }
}
