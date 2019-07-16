//
//  AddPhotoViewController.swift
//  MinaViewFinder2
//
//  Created by Ginalyn Mina on 7/15/19.
//  Copyright © 2019 Ginalyn Mina. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var imagePicker = UIImagePickerController()

    @IBAction func CameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func LibraryTapped(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        present (imagePicker, animated: true, completion: nil)
    }
    
    @IBOutlet weak var newImageView: UIImageView!
    @IBOutlet weak var captionText: UITextField!
    
    @IBAction func SaveTapped(_ sender: UIButton) {
            if let context = (UIApplication.shared.delegate as? AppDelegate)? .persistentContainer.viewContext {
                let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
                
                photoToSave.caption = captionText.text
        
                if let userImage = newImageView.image {
                    if let userImageData = userImage.pngData() {
                photoToSave.addPhoto = userImageData
            }
        }
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                
                navigationController?.popViewController(animated:true)
        }
    }
    internal func imagePickerController (_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImageView.image = selectedImage
        }
        imagePicker.dismiss(animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}

