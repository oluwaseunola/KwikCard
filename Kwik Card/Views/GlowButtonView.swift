//
//  SwiftUIView.swift
//  Kwik Card
//
//  Created by Seun Olalekan on 2021-09-15.
//

import SwiftUI

struct GlowButtonView: View {
    
    var label : String
    var action : () -> Void
    
    var gradient1: [Color] = [
          Color.init(red: 101/255, green: 134/255, blue: 1),
          Color.init(red: 1, green: 64/255, blue: 80/255),
          Color.init(red: 109/255, green: 1, blue: 185/255),
          Color.init(red: 39/255, green: 232/255, blue: 1)
      ]
    
    var body: some View {
        

        Button(action: action) {
            
            ZStack{
                
                            
                AngularGradient(gradient: Gradient(colors: gradient1), center: .center, angle: .degrees(180)).mask(RoundedRectangle(cornerRadius: 16).frame(height: 52))
                    .blur(radius: 8)
                
                RoundedRectangle(cornerRadius: 16).frame( height:52).foregroundColor(Color("color4"))
                
                Text(label).bold()
                    .foregroundColor(.white)
                
            }.frame(height:52)
        }
        
        
        
        
       
        
        
    }
}


