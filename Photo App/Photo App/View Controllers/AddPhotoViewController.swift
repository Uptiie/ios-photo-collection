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
        
        updateViews()
        
        
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = imageTitleTextField.text, let imageData = photoImageView.image?.pngData() else {return}
        
        
        if let photo = photo {
            
            updateViews()
            navigationController?.popViewController(animated: true)
            
        } else {
            
            let photoS = Photo(imageData: imageData, title: title)
            photoController!.createPhoto(photo: photoS)
            navigationController?.popViewController(animated: true)
            
        }
    }
    
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else {return}
        
        if theme == "Dark" {
            view.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        } else {
            view.backgroundColor = #colorLiteral(red: 0.2626167812, green: 0.5972863502, blue: 0.9132495241, alpha: 1)
        }
        
        
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo, let imageTitle = imageTitleTextField.text else {return}
        photoImageView.image = UIImage(data: photo.imageData)
        imageTitleTextField.text = imageTitle
    }
    
}

extension AddPhotoViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard  let imageURL = info[.imageURL] as? URL else {return}
        
        guard   let data = try? Data.init(contentsOf: imageURL) else {return}
        photoImageView.image = UIImage(data: data)
       
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension AddPhotoViewController: UINavigationControllerDelegate {}


