//
//  ProfileViewController.swift
//  MyTrips.V2
//
//  Created by Света Брасс on 30.03.21.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
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


