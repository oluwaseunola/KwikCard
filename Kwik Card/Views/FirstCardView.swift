//
//  FirstCardView.swift
//  Kwik Card
//
//  Created by Seun Olalekan on 2021-09-17.
//

import SwiftUI

struct FirstCard: View{
    
    @Binding var name : String
    @Binding var company : String
    @Binding var position : String



    
    var body: some View{
        
        
    }
    
    
    
}

struct FirstCardView_Previews: PreviewProvider {
    static var previews: some View {
        FirstCard(name: .constant(""), company: .constant(""), position: .constant(""))
    }
}
