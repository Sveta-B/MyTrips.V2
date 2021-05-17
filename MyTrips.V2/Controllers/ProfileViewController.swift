//
//  ProfileViewController.swift
//  MyTrips.V2
//
//  Created by Света Брасс on 30.03.21.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    // MARK: - Properties
    
    var imageForAvatar =  UIImage(named: "owe") {
        willSet {
            avatarImageView.image = newValue
        }
    }
 
    // MARK: - IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImageView.image = imageForAvatar
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2
        avatarImageView.clipsToBounds = true
        guard let currentUser = Auth.auth().currentUser else {return }
        print(currentUser.uid)
        APIManager.getData(userUid: currentUser.uid) { (image) in
        self.imageForAvatar = image
        }
    
    }
    
    // MARK: - IBActions
    @IBAction func logout(_ sender: UIButton) {
        do {
                try FirebaseAuth.Auth.auth().signOut()
            } catch {
                print(error.localizedDescription)
            }
           print("logout")
            
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


