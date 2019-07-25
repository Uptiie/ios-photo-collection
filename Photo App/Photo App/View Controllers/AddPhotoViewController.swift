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
    
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else {return}
        
        if theme == "Dark" {
            view.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        } else {
            view.backgroundColor = #colorLiteral(red: 0.2626167812, green: 0.5972863502, blue: 0.9132495241, alpha: 1)
        }
        
        
    }
    
}
