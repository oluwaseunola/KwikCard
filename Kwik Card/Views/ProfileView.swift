//
//  ProfileView.swift
//  Kwik Card
//
//  Created by Seun Olalekan on 2021-09-16.
//

import SwiftUI

struct ProfileView: View {
    @State var cardPosition : CGSize = .zero
    @State var showSettingsView : Bool = false
       
    @State var name : String = ""
    @State var email : String = ""
    @State var phone : String = ""
    @State var company : String = ""
    @State var position : String = ""
    @State var twitter : String = ""
    @State var instagram : String = ""
    @State var website : String = ""
    @State var bio : String = ""
    @State var image : Image?

    
    
    @State var passedImage : UIImage?
    
    @Environment(\.presentationMode) private var presentationMode
   
    var body: some View {
        
        ZStack(alignment: .top){
            Color("backgroundColor2").edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack{
                    Spacer()
                    Button {
                        showSettingsView = true
                    } label: {
                        IconView(imageName: "gear")
                    }

                }.padding()
                    
                
                
                GeometryReader { geometry in
                    
                    VStack(){
                        
                        Text(name).font(.largeTitle).bold()
                        
                        
                        if image != nil{
                            
                            image?.resizable(
                                ).aspectRatio( contentMode: .fill).frame(width:100, height: 100).clipShape(Circle())
                    
                   
                        
                        }else{
                            
                            Circle().stroke(.black).frame(width:100).overlay(Image(systemName: "photo").foregroundColor(.black))
                            
                            
                        }
                        
                        if (!company.isEmpty) != nil{
                            Text(company).font(.footnote).foregroundColor(.gray)
                        }
                       
                        
                        if (!position.isEmpty) != nil{
                            Text(position).font(.caption).foregroundColor(.gray)
                        }
                        
                        if (!email.isEmpty) != nil{
                            Text(email).frame(maxWidth: geometry.size.width)
                                .frame(height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke())
                                .cornerRadius(12)
                                .padding(.horizontal)
                        }
                       
                        if (!phone.isEmpty) != nil{
                            Text(phone).foregroundColor(.blue).frame(maxWidth: geometry.size.width)
                                .frame(height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke())
                                .cornerRadius(12)
                                .padding(.horizontal)
                        }
                        
                       
                        
                        if let url = URL(string: "https://\(website)"){
                            
                            Link(destination: url, label: {
                                Text(website)
                            }).frame(maxWidth: geometry.size.width)
                                .frame(height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke())
                                .cornerRadius(12)
                                .padding(.horizontal)
                        }
                        
                        
                        if let url = URL(string: "https://www.instagram.com/\(instagram)/"), !instagram.isEmpty{
                            
                            Link(destination: url, label: {
                                Text(instagram).autocapitalization(.none)
                            }).frame(maxWidth: geometry.size.width)
                                .frame(height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke())
                                .cornerRadius(12)
                                .padding(.horizontal)
                                
                        }
                            
            
                        
                        if let url = URL(string: "https://twitter.com/\(twitter)?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor"), !twitter.isEmpty{
                            
                            Link(destination: url, label: {
                                Text(twitter)
                            }).frame(maxWidth: geometry.size.width)
                                .frame(height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke())
                                .cornerRadius(12)
                                .padding(.horizontal)
                        }
                        
                        VStack(){
                            
                            HStack{ Text("About me").bold()
                                Spacer()
                                
                            }.padding(.leading,20)
                                .padding(.top)
                                
                            
                            Text(bio).padding()
                            
                        }
                        
                        
                        
                    }.frame(height: geometry.size.height)
                        .frame(maxWidth: geometry.size.width)
                        .background(Color.white)
                       
                        .cornerRadius(30)
                        .padding(.horizontal)
                        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                        .offset(x: cardPosition.width, y: cardPosition.height)
                        .gesture(DragGesture().onChanged({ value in
                            cardPosition = value.translation
                        }).onEnded({ _ in

                         
                                cardPosition = .zero
                            

                        }))
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 1, y: 1)
                        
                   
                    
                }

            }
            
        }.fullScreenCover(isPresented: $showSettingsView, onDismiss: {
            fetchProfileData()
            
            if UserDefaults.standard.bool(forKey: "isLoggedIn") == false{
                presentationMode.wrappedValue.dismiss()
            }
            
        }, content: {
            SettingsView()
        })
        .onAppear {
        
            fetchProfileData()
        
        }
    }
    
    func fetchProfileData(){
        DatabaseManager.shared.fetchUserData() { loadedModel in
            
            DispatchQueue.main.async {
                name = loadedModel.name
                email = loadedModel.email
                phone = loadedModel.phone
                instagram = loadedModel.instagram
                twitter = loadedModel.twitter
                website = loadedModel.website
                company = loadedModel.company
                position = loadedModel.position
                bio = loadedModel.bio
            }
            
            
            
        }
        
        StorageManager.shared.setProfilePicture { firebaseData in
            
            guard let firebaseData = firebaseData else {
                return
            }
            
            guard let safeImage = UIImage(data: firebaseData) else {return}

            DispatchQueue.main.async {
                
                image = Image(uiImage:safeImage)

            }
            
            
        }
        
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct InstagramLink: View{
    
    @State var handle : String
    @State var label : String
    
    
    
    var body: some View{
        
        Link(destination: URL(string: "https://www.instagram.com/\(handle)/")!) {
            
Text(label)
            
            
            
            
        }
        
        
        
        
        
        
        
     
        
        
    }
    
    
    
}

struct TwitterLink: View{
    
    @State var handle : String
    @State var label : String
    
    
    
    var body: some View{
    
        
        
        Link(destination: URL(string: "https://twitter.com/\(handle)?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor")!) {
            
            
            
Text(label)
            
            
            
            
        }
        
        
        
        
        
        
        
     
        
        
    }
    
    
    
}
