//
//  PhotoCollectionViewController.swift
//  Photo App
//
//  Created by Uptiie on 7/25/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotoCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setTheme()

      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.reloadData()
        setTheme()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //        AddPhotoSegue
    //        viewPhotoSegue
    //        ThemeSegue
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoSegue" {
            guard let addVC = segue.destination as? AddPhotoViewController else {return}
            addVC.themeHelper = themeHelper
            addVC.photoController = photoController
        } else if segue.identifier == "viewPhotoSegue" {
            guard let viewVC = segue.destination as? AddPhotoViewController else {return}
            viewVC.photoController = photoController
           viewVC.themeHelper = themeHelper
            guard let index = collectionView.indexPathsForSelectedItems?.first else {return}
            viewVC.photo = photoController.photos[index.item]
        } else if segue.identifier == "ThemeSegue" {
            guard let themeVC = segue.destination as? ThemeViewController else {return}
            themeVC.themeHelper = themeHelper
        }
        
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell else {return UICollectionViewCell()}
    
     let selectedPhoto = photoController.photos[indexPath.item]
      cell.photo = selectedPhoto
        return cell
    }

   

    func setTheme() {
        guard let theme = themeHelper.themePreference else {return}
        
        if theme == "Dark" {
            collectionView.backgroundColor  = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
           
           
        } else {
            collectionView.backgroundColor = #colorLiteral(red: 0.2626167812, green: 0.5972863502, blue: 0.9132495241, alpha: 1)
            
        }
        
        
    }

}
