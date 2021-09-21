//
//  AuthManager.swift
//  Kwik Card
//
//  Created by Seun Olalekan on 2021-09-17.
//

import Foundation
import FirebaseAuth

struct AuthManager{
    
    static let shared = AuthManager()
    
    
    func logIn(email: String, password: String, completion: @escaping (Bool)-> Void){
        
        Auth.auth().signIn(withEmail: email, password: password) { success, error in
            
            if success != nil{
                
                completion(true)
                
            }
            else{
                completion(false)
                print(error?.localizedDescription)
            }
        }
        
    }
    
    
    func createUser(email: String, password: String, completion: @escaping (Bool)-> Void){
        
        Auth.auth().createUser(withEmail: email, password: password) { success, error in
            
            if success != nil{
                
                completion(true)
                
            }
            else{
                completion(false)
                print(error?.localizedDescription)
            }
        }
        
    }
    
    
    func signOut(){
        
        do {
            try Auth.auth().signOut()

        }catch{
            print(error.localizedDescription)
        }
        
    }
    
    
}
