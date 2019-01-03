//
//  ViewController.swift
//  Learning
//
//  Created by NTAM on 12/30/18.
//  Copyright © 2018 NTAM. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        picker.delegate = self
    }

    @IBAction func selectImage(_ sender: Any) {
//        picker.sourceType = .photoLibrary
//        picker.allowsEditing = true
//        present(picker, animated: true, completion: nil)
        
        
        let alert = UIAlertController(title: "title", message: "Choose your source", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Camera", style: .default) { (result : UIAlertAction) -> Void in
            self.picker.sourceType = .camera
            self.present(self.picker, animated: true, completion: nil)
        })
        alert.addAction(UIAlertAction(title: "Photo library", style: .default) { (result : UIAlertAction) -> Void in
            self.picker.sourceType = .photoLibrary
            self.present(self.picker, animated: true, completion: nil)
        })

        self.present(alert, animated: true, completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey : Any]) {
        
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }
        dismiss(animated: true, completion: nil)
        
        
    }
}

