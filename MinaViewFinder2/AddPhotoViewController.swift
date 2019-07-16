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

    @IBAction func CameraTapped(_ sender: UIButton) {
        print("camera tapped")
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
   
    @IBAction func LibraryTapped(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        present (imagePicker, animated: true, completion: nil)
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
