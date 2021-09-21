//
//  StorageManager.swift
//  Kwik Card
//
//  Created by Seun Olalekan on 2021-09-18.
//

import Foundation
import FirebaseStorage

struct StorageManager{
    
    
    static let shared = StorageManager()
    
    let storage = Storage.storage()
    
    func uploadProfileImage(photo: Data?, completion : @escaping (Bool)-> Void){
        
        guard let username = UserDefaults.standard.string(forKey: "userEmail") else {return}
        guard let photoData = photo else{return}
        
        storage.reference().child("\(username).profilePicture").putData(photoData, metadata: nil) { _, error in
            
            if error == nil{
                completion(true)
            }
            else{
                print(error?.localizedDescription)
                completion(false)
            }
            
        }
        
        
    }
    
    
    
    func setProfilePicture(completion : @escaping (Data?)-> Void){
        
        guard let username = UserDefaults.standard.string(forKey: "userEmail") else {return}

        
        storage.reference().child("\(username).profilePicture").getData(maxSize: .max) { data, error in
            
            if error == nil{
                completion(data)
            }else{
                print(error?.localizedDescription)
                completion(nil)
            }
            
        }
        
    }
}
