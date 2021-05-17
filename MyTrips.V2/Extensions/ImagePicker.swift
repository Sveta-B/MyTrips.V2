//
//  ImagePicker.swift
//  MyTrips.V2
//
//  Created by Света Брасс on 15.05.21.
//

import UIKit

extension AddTripTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated:  true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageIsChanged = true
        
//        let refImage = Storage.storage().reference().child("trips").child(user.uid).child(countryNameField.text!)
//                      guard let imadeData = imageOfCountry.image?.jpegData(compressionQuality: 0.2) else {
//                          return
//                      }
//                      
//                      let metadata = StorageMetadata()
//                      metadata.contentType = "image/jpeg"
//                      refImage.putData(imadeData, metadata: metadata)  { (metadata, error) in
//                                 guard let _ = metadata else {
//                                 print(error!)
//                                 return
//                             }
//                          refImage.downloadURL { (downloadURL, error) in
//                           guard  let url = downloadURL?.absoluteString else {
//                           print(error!)
//                                      return}
//                           self.myImageURL = url
//                            
//                          }
//                      
//                  }
        dismiss(animated: true)
    }
}
