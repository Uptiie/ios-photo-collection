//
//  AddPhotoViewController.swift
//  Photo App
//
//  Created by Uptiie on 7/25/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var imageTitleTextField: UITextField!
    @IBOutlet weak var addPhotoButton: UIButton!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addButtonTapped(_ sender: UIButton) {
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
}
