//
//  SettingsView.swift
//  Kwik Card
//
//  Created by Seun Olalekan on 2021-09-17.
//

import SwiftUI
import Combine

struct SettingsView: View {
    @State var image : Image?
    @State var data : Data?
    @State var name : String = ""
    @State var email : String = ""
    @State var phone : String = ""
    @State var company : String = ""
    @State var position : String = ""
    @State var twitter : String = ""
    @State var instagram : String = ""
    @State var website : String = ""
    @State var bio : String = ""
    @State var textCount = 120
    @State var showAlert : Bool = false
    @State var showImagePicker : Bool = false
    @State var inputImage : UIImage?
    @State var showImageAlert : Bool = false

    
    @Environment(\.presentationMode) private var presentationMode

    
    var body: some View {
        
        ZStack(alignment: .top){
            
            Color("backgroundColor2").edgesIgnoringSafeArea(.all)
           
            
            
            VStack{
                
                ZStack {
                    Text("Settings").font(.title).bold()
                    HStack{
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Close")
                        }.padding(.leading)

                        Spacer()
                        Button {
                            AuthManager.shared.signOut()
                            UserDefaults.standard.set(false, forKey: "isLoggedIn")
                            
                            presentationMode.wrappedValue.dismiss()
                            
                            
                            
                        } label: {
                            Text("Log out")
                        }

                    }.padding(.trailing)
                }
                
                GeometryReader { geometry in
                    
                    VStack(){
                        
                        Button {
                            showImagePicker = true
                        
                            
                        } label: {
                            
    
                                if image != nil{
                                    
                                    image?.resizable(
                                        ).aspectRatio( contentMode: .fill).frame(width:100, height: 100).clipShape(Circle())
                            
                           
                                
                                }else{
                                    
                                    Circle().stroke(.black).frame(width:100).overlay(Image(systemName: "photo").foregroundColor(.black))
                                    
                                    
                                }
                                
                            }                             .padding(.bottom)

                        
                        
                        
                    
                
                                
                            
                            
                       
                            
                            

                        
                        
                        
                        Group {
                            TextField("Name", text: $name).frame(maxWidth: geometry.size.width)
                                .frame(height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke())
                                .cornerRadius(12)
                                .padding(.horizontal)
                            .multilineTextAlignment(TextAlignment.center)
                            
                            TextField("Company", text: $company).frame(maxWidth: geometry.size.width)
                                .frame(height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke())
                                .cornerRadius(12)
                                .padding(.horizontal)
                                .multilineTextAlignment(TextAlignment.center)
                            
                            TextField("Position", text: $position).frame(maxWidth: geometry.size.width)
                                .frame(height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke())
                                .cornerRadius(12)
                                .padding(.horizontal)
                                .multilineTextAlignment(TextAlignment.center)
                            
                            TextField("Email", text: $email).frame(maxWidth: geometry.size.width)
                                .frame(height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke())
                                .cornerRadius(12)
                                .padding(.horizontal)
                                .multilineTextAlignment(TextAlignment.center)
                            
                            TextField("Phone", text: $phone).frame(maxWidth: geometry.size.width)
                                .frame(height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke())
                                .cornerRadius(12)
                                .padding(.horizontal)
                                .multilineTextAlignment(TextAlignment.center)
                           
                            TextField("Website", text: $website).frame(maxWidth: geometry.size.width)
                                .frame(height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke())
                                .cornerRadius(12)
                                .padding(.horizontal)
                                .autocapitalization(.none)
                                .multilineTextAlignment(TextAlignment.center)
                                
                            
                            TextField("Instagram", text: $instagram).frame(maxWidth: geometry.size.width)
                                .frame(height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke())
                                .cornerRadius(12)
                                .padding(.horizontal)
                                .multilineTextAlignment(TextAlignment.center)
                            
                            TextField("Twitter", text: $twitter).frame(maxWidth: geometry.size.width)
                                .frame(height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke())
                                .cornerRadius(12)
                                .padding(.horizontal)
                                .multilineTextAlignment(TextAlignment.center)
                        }
                        
        
                        VStack(){
                            
                            HStack{ Text("About me").bold()
                                Spacer()
                                
                            }.padding(.leading,20)
                                .padding(.top)
                                
                            TextEditor(text: $bio)
                                .background(Color.white).cornerRadius(10)
                                .padding(.horizontal, 30)
                                .padding(.bottom, 15)
                            
                            Text("\(textCount - bio.count) characters left").font(.footnote)
                            
                        
                            GlowButtonView(label: "Save") {
                                var countHolder : Int
                                
                                countHolder = bio.count
                                
                                if countHolder > 120 {
                
                                    showAlert = true

                                } else{
                                    
                                    let userData = UserModel(name: name, email: email, phone: phone, company: company, position: position, twitter: twitter, instagram: instagram, website: website, bio: bio)
                                    
                                    DatabaseManager.shared.saveUserProfile(model: userData) { success in
                                        
                                        if success{
                                            
                                           
                                        }
                                    }
                                    
                                   uploadImage()
                                    
                                    
                                }
                                
                                
                            }.padding(.horizontal,100)
                                .padding(.top)
                            .alert(isPresented: $showAlert) {
                            
                            Alert(title: Text("Character Limit exceeded."), message: Text("Shorten your text. Remember, short & sweet!"), dismissButton: .default(Text("Got it.")))
                        }
                        
                        
                        
                        
                    }
                      
                       
                   
                    
                }
                
                                
            }.onAppear {
                
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
        
        }
        }.sheet(isPresented: $showImagePicker)
        {
            loadImage()
        } content: {
            ImagePicker(image: $inputImage)
        }
        .alert(isPresented: $showImageAlert) {
            Alert(title: Text("Profile Saved"), message: nil, dismissButton: .default(Text("OK")))
        }

        
        
    }
    
    private func uploadImage(){
        
        StorageManager.shared.uploadProfileImage( photo: data ) { success in
            if success{
                print("Photo Saved to Database")
                showImageAlert = true

                UserDefaults.standard.set(data, forKey: "photoData")
                
                }
             else{
                print("something went wrong")
            }

        }
        
    }
    
    private func loadImage(){
        
        guard let inputImage = inputImage else {
            return
        }
        
        image = Image(uiImage: inputImage)
        data = inputImage.jpegData(compressionQuality: 1)
        
        
        }
        
        
        

        
    }


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
