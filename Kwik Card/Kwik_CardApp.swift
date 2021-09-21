//
//  Kwik_CardApp.swift
//  Kwik Card
//
//  Created by Seun Olalekan on 2021-09-14.
//

import SwiftUI
import Firebase


@main
struct Kwik_CardApp: App {
    
    let persistenceController = PersistenceController.shared
    
    
init(){
    
    FirebaseApp.configure()

}


    var body: some Scene {
        
        WindowGroup {
        
            
                
                LoginView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
            
           
        }
    }
}
