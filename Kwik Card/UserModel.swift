//
//  UserModel.swift
//  Kwik Card
//
//  Created by Seun Olalekan on 2021-09-17.
//

import Foundation



struct UserModel : Codable {
    
    
    var name : String
    var email : String
    var phone : String
    var company : String
    var position : String
    var twitter : String
    var instagram : String
    var website : String
    var bio : String
    
    var id : UUID = {
        
        let object = UUID()
        
        return object
    }()
    
}
