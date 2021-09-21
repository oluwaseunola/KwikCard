//
//  DatabaseManager.swift
//  Kwik Card
//
//  Created by Seun Olalekan on 2021-09-17.
//

import Foundation
import FirebaseFirestore

struct DatabaseManager{
    
    static let shared = DatabaseManager()
    
    let database = Firestore.firestore()
    
    func saveUserProfile(model: UserModel, completion: @escaping (Bool)-> Void){
        
        guard let username = UserDefaults.standard.string(forKey: "userEmail") else {return}
        
        let ref = database.collection("users").document(username)
        
        guard let userData = model.makeDictionary() else{return}
        
        ref.setData(userData) { error in
            if error != nil{
                
                completion(true)
            }
            else{
                completion(false)
            }
        }
        
    }
    
    func fetchUserData(completion: @escaping (UserModel)-> Void){
        
        guard let username = UserDefaults.standard.string(forKey: "userEmail") else {return}

        let ref = database.collection("users")
        
        ref.getDocuments { snapshot, error in
            
            let users = snapshot?.documents.compactMap({UserModel(with: $0.data())
            })
            
            guard let loggedInUser = users?.filter({$0.email == username}).first else{return}
            
            completion(loggedInUser)
            
            
            
        }
        
        
        
    }
    
    
}
