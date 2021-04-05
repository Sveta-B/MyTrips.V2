//
//  APIManager.swift
//  MyTrips.V2
//
//  Created by Света Брасс on 19.03.21.
//

import UIKit
import Firebase
import FirebaseFirestore


class APIManager {
    
    
    

static let shared = APIManager()
    
    enum AuthResult {
            case success
            case failure(Error)
        }
 
    class  func configureDB() -> Firestore {
         var db: Firestore!
         db = Firestore.firestore()
         return db
         
     }
    
    class func getData(userUid: String, complition: @escaping (UIImage) -> Void)  {
      
         let ref = Storage.storage().reference().child("avatars")
        var image = UIImage(named: "owe")!
        let avatarRef = ref.child(userUid)
        avatarRef.getData(maxSize: 1024*1024, completion: { data, error in
            guard error == nil else { complition(image); return}
            image = UIImage(data: data!)!
            complition(image)
        })
          
           
       }
    
    
   
    class  func register(email: String?, password: String?, fullname: String?, avatar: UIImage?,  complition: @escaping (AuthResult) -> Void)  {
        
        var userUid: String?
        var ref: StorageReference?
        var stringUrl: String?
        let defaultAvatar = UIImage(systemName: "person.fill")
        
        guard let email = email, let password = password else {
            complition(.failure(AuthError.notFilled))
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let _ = result  else {
                complition(.failure(error!))
                return
            }
             userUid = result!.user.uid
            ref = Storage.storage().reference().child("avatars").child(userUid!)
           
            
            guard   let imageForAvatar =  avatar ?? defaultAvatar else {return}
        
            guard let imageData = imageForAvatar.jpegData(compressionQuality: 0.4) else {
                            complition(.failure(AuthError.photoNotExist))
                            return }
                                let metadata = StorageMetadata()
                                metadata.contentType = "image/jpeg"
            ref?.putData(imageData, metadata: metadata) { (metadata, error) in
                guard let _ = metadata else {
                    print(error!)
                    return
                }
                
                
                ref?.downloadURL { (downloadedUrl, error) in
                    if downloadedUrl != nil {
                        stringUrl = downloadedUrl?.absoluteString
                        
                    }
                    self.configureDB().collection("users").addDocument(data: ["email": email, "fullname": fullname ?? "User", "avatarUrl": stringUrl as Any, "uid": userUid!]) { (error) in
                        if error != nil {
                            complition(.failure(AuthError.serverError))
                        }
                        complition(.success)
                    }
                }
            }
        }
    }
    
    class func singIn(email: String?, password: String?, complition: @escaping (AuthResult) -> Void) {
        guard let email = email, let password = password else {
            complition(.failure(AuthError.notFilled))
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                complition(.failure(AuthError.invalidEmail))
                print(error?.localizedDescription as Any)
                return}
                print("done")
                print(user?.description as Any)
        
       
        }
        
    }
}

