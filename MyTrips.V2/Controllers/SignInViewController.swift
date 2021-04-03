//
//  SignInViewController.swift
//  MyTrips.V2
//
//  Created by Света Брасс on 19.03.21.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase


class SignInViewController: UIViewController {
    
  
        
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                avatarImage.isUserInteractionEnabled = true
                avatarImage.addGestureRecognizer(tapGestureRecognizer)
       
    }
    

    @IBAction func pressedSingUp(_ sender: UIButton) {
        
        APIManager.register(email: emailTextField.text, password: passwordTextField.text, fullname: firstNameTextField.text, avatar: avatarImage.image) { (result) in
            switch result {
            case .success:
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "MainTabBarViewController") as! MainTabBarViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                
                print("успешно")
            
            case .failure(let error):
                print(error)
                self.showAlert(mesage: "Fill all field", title: "Error")
            }
        
        }
        }
    
    func showAlert(mesage: String, title: String)  {
    let alert = UIAlertController(title: title, message: mesage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
        }
    
    @IBAction func cancelRegister(_ sender: UIButton) {
        dismiss(animated: true)
    }

}


extension SignInViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
func chooseImagePicker()  {
let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
present(imagePicker,animated: true)
    }
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        avatarImage.image = info[.editedImage] as? UIImage
        avatarImage.clipsToBounds = true
dismiss(animated: true)
    }
@objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
chooseImagePicker()
    }
}
