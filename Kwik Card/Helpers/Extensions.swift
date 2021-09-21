//
//  Extensions.swift
//  Kwik Card
//
//  Created by Seun Olalekan on 2021-09-17.
//

import Foundation

extension Decodable{
    init?(with dictionary: [String: Any]) {
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted) else {return nil}
        guard let result = try? JSONDecoder().decode(Self.self, from: data) else{return nil}
        
        self = result
        
        
        
    }
}

extension Encodable{
    
    func makeDictionary() -> [String: Any]? {
        
        do{ guard let data = try? JSONEncoder().encode(self) else{
            return nil}
            
            let json = try? JSONSerialization.jsonObject(with: data , options: .fragmentsAllowed) as? [String : Any]
            
            return json
        }
         
    }
    
}
