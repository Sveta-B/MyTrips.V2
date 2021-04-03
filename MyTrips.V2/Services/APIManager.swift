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
    
    func fetchData(userUid: String) -> (UIImage, String)? {
           var imageForAvatar = UIImage()
        var userName: String?
           guard let currentUser = Auth.auth().currentUser else {return nil }
         //  self.user = MyUser(user: currentUser)
         let ref = Database.database().reference(withPath: "users").child(userUid)
        
          ref.child("avatarUrl").observe(.value) { (snapshot) in
               let url = URL(string: snapshot.value as? String ?? "https://firebasestorage.googleapis.com/v0/b/mytrips-v3-cf18f.appspot.com/o/avatars%2FfilledStar.png?alt=media&token=7bc4b930-4a58-4a97-afca-1b7cdfb15d0a")
               do {
                   let data = try Data(contentsOf: url!)
                   imageForAvatar = UIImage(data: data) ?? UIImage(named: "photo")!
               } catch {
                   print("no data")
               }
               
               
           }
           ref.child("fullname").observe(.value) { (snapshot) in
               userName = snapshot.value as? String ?? "Name"
               
           }
        return (imageForAvatar, userName) as? (UIImage, String)
           
       }
    
    
//    class func uploadAvatar(image: UIImage?, uid: String?, complition: @escaping (AuthResult) -> Void) {
//        let ref = Storage.storage().reference().child("avatars").child(uid!)
//        guard let imageData = image!.jpegData(compressionQuality: 0.4) else {
//                    return }
//                        let metadata = StorageMetadata()
//                        metadata.contentType = "image/jpeg"
//                        ref.putData(imageData, metadata: metadata) { (metadata, error) in
//                            guard let _ = metadata else {
//                            print(error!)
//                            return
//                            }
//                           
//    }
//                        }
   
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

