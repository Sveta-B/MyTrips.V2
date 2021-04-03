//
//  LoginViewController.swift
//  MyTrips.V2
//
//  Created by Света Брасс on 18.03.21.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
              

    }
    
    @IBAction func pressedLogIn(_ sender: UIButton) {
        APIManager.singIn(email: emailTextField.text, password: passwordTextField.text) { (result) in
            switch result {
            
            case .success:
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                   let vc = storyboard.instantiateViewController(identifier: "MainTabBarViewController") as! MainTabBarViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            case .failure(let error):
                print(error)
                self.showAlert(mesage: "Wrong password or email", title: "Error")
            }
            
                
            }
            
        }
    
    func showAlert(mesage: String, title: String)  {
    let alert = UIAlertController(title: title, message: mesage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    

