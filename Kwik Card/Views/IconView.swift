//
//  IconView.swift
//  Kwik Card
//
//  Created by Seun Olalekan on 2021-09-14.
//

import SwiftUI

struct IconView: View {
    
    @State var imageName : String
    
    var gradient1: [Color] = [
          Color.init(red: 101/255, green: 134/255, blue: 1),
          Color.init(red: 1, green: 64/255, blue: 80/255),
          Color.init(red: 109/255, green: 1, blue: 185/255),
          Color.init(red: 39/255, green: 232/255, blue: 1)
      ]
    
    
    var body: some View {
        
        ZStack{
            AngularGradient(gradient: Gradient(colors: gradient1), center: .center, angle: .degrees(170)).mask(RoundedRectangle(cornerRadius: 15).frame(width: 60.0, height: 60.0))
                .blur(radius: 8)
                .overlay(Image(systemName: imageName).frame(width: 60, height: 60)
                            .foregroundColor(Color.gray).background(Color.white).cornerRadius(15))
                
            
            
            
            
        }.frame(width:60, height: 60)
        
        
        
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(imageName: "person")
    }
}
