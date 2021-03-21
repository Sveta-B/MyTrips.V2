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
        guard let email = email, let password = password else {
            complition(.failure(AuthError.notFilled))
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let _ = result  else {
                complition(.failure(error!))
                return
            }
            print("создан")
        
             userUid = result!.user.uid
        
            var ref: StorageReference?
            var stringUrl: String?
            
        
        ref = Storage.storage().reference().child("avatars").child(userUid!)
                guard let imageData = avatar!.jpegData(compressionQuality: 0.4) else {
                            complition(.failure(AuthError.photoNotExist))
                            return }
                                let metadata = StorageMetadata()
                                metadata.contentType = "image/jpeg"
                                ref?.putData(imageData, metadata: metadata) { (metadata, error) in
                                    print("put", Thread.current)
                                  guard let _ = metadata else {
                                    print(error!)
                                    return
                                    }
                                    print("аватар загружен")
                                
            
        
            ref?.downloadURL { (downloadedUrl, error) in
                if downloadedUrl != nil {
                    stringUrl = downloadedUrl?.absoluteString
                    
                }
                    self.configureDB().collection("users").addDocument(data: ["email": email, "fullname": fullname!, "avatarUrl": stringUrl as Any, "uid": userUid!]) { (error) in
                             if error != nil {
                                 complition(.failure(AuthError.serverError))
                             }
                             complition(.success)
                         }
                }

            
        }

        }
    }
    
    
}

