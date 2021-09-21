//
//  OnboardScreen.swift
//  Kwik Card
//
//  Created by Seun Olalekan on 2021-09-15.
//

import SwiftUI
import Combine

class LogInViewModel{
    static public var isLoggedOut : Bool = false
}


struct OnboardScreen: View {
    
    @State var name : String = ""
    @State var email : String = ""
    @State var phone : String = ""
    @State var company : String = ""
    @State var position : String = ""
    @State var twitter : String = ""
    @State var instagram : String = ""
    @State var website : String = ""
    @State var bio : String = ""
    @State var showFirstCard : Bool = true
    @State var showSecondCard : Bool = false
    @State var showThirdCard : Bool = false
    @State var showFourthCard : Bool = false
    @State var textCount = 120
    @State var showAlert : Bool = false
    @State var showProfileView = false
    @State var currentModel : UserModel?
    @State var removeCurrentView : Bool = false
    @State var showLoginView : Bool = false

    
    @Environment(\.presentationMode) private var presentation
    
    
    var body: some View {
        
        
        ZStack {
            
            Color("backgroundColor2").edgesIgnoringSafeArea(.all)
            
            Button {
                presentation.wrappedValue.dismiss()
            } label: {
                Text("close")
            }

            
            if showFirstCard{
                
                ZStack(alignment: .top){
                    Color("backgroundColor2").edgesIgnoringSafeArea(.all)
                    
                    VStack(alignment: .leading){
                        
                        GeometryReader { geometry in
                            
                            Image("headerImage").resizable().aspectRatio( contentMode: .fit)
                                .frame(width: geometry.size.width, height: 250)
                            
                        }.frame(height:250)
                        
                        
                        
                        Text("Tell us about yourself. ").font(.largeTitle).bold()
                            .padding(.leading,30)
                            .padding(.bottom, 5)
                        
                        Text("Let's start with some general info").font(.footnote).foregroundColor(.gray).padding(.leading,30)
                            .padding(.bottom, 20)
                        
                        
                        VStack(alignment:.center, spacing: 20){
                            
                            TextField("First & Last Name", text: $name)
                                .frame(height:52)
                                .background(Color.white).cornerRadius(10)
                                .multilineTextAlignment(TextAlignment.center).padding(.horizontal, 30)
                                .autocapitalization(.none)
                            
                            TextField("Company ", text: $company).frame(height:52)
                                .background(Color.white).cornerRadius(10)
                                .multilineTextAlignment(TextAlignment.center).padding(.horizontal, 30)
                                .autocapitalization(.none)
                            
                            TextField("Position ", text: $position ) .frame(height:52)
                                .background(Color.white).cornerRadius(10)
                                .multilineTextAlignment(TextAlignment.center).padding(.horizontal, 30)
                                .autocapitalization(.none)
                            
                            Button {
                                showSecondCard = true
                            } label: {
                                
                                HStack {
                                    Text("Continue")
                                    Image(systemName: "arrow.right")
                                }
                            }

                            
                        }
                        
                        
                    }
                    
                } }
            
            
            if showSecondCard{
                
                ZStack(alignment: .top){
                    Color("backgroundColor2").edgesIgnoringSafeArea(.all)
                    
                    VStack(alignment: .leading){
                        
                        GeometryReader { geometry in
                            
                            Image("headerImage2").resizable().aspectRatio( contentMode: .fit)
                                .frame(width: geometry.size.width, height: 250)
                        }.frame(height:250)
                        
                        
                        
                        Text("Let's get some\ncompany details. ").font(.largeTitle).bold()
                            .padding(.leading,30)
                            .padding(.bottom, 5)
                        
                        Text("Enter your business email & phone number").font(.footnote).foregroundColor(.gray).padding(.leading,30)
                            .padding(.bottom, 20)
                        
                        
                        VStack(alignment:.center, spacing: 20){
                            
                            TextField("Email", text: $email)
                                .frame(height:52)
                                .background(Color.white).cornerRadius(10)
                                .multilineTextAlignment(TextAlignment.center).padding(.horizontal, 30)
                                .autocapitalization(.none)
                            
                            TextField("Phone Number ", text: $phone).frame(height:52)
                                .background(Color.white).cornerRadius(10)
                                .multilineTextAlignment(TextAlignment.center).padding(.horizontal, 30)
                                .autocapitalization(.none)
                            
                            
                            Button {
                                showThirdCard = true
                            } label: {
                                
                                HStack {
                                    Text("Continue")
                                    Image(systemName: "arrow.right")
                                }
                            }
                            
                            
                        }
                        
                        
                        
                    }
                    
                }
                
            }
            
            if showThirdCard{
                
                
                ZStack(alignment: .top){
                    Color("backgroundColor2").edgesIgnoringSafeArea(.all)
                    
                    VStack(alignment: .leading){
                        
                        GeometryReader { geometry in
                            
                            Image("socialHandles").resizable().aspectRatio( contentMode: .fit)
                                .frame(width: geometry.size.width, height: 200)
                        }.frame(height:200)
                        
                        
                        
                        Text("Let's see those\nsocial handles. ").font(.largeTitle).bold()
                            .padding(.leading,30)
                            .padding(.bottom, 5)
                        
                        Text("Enter your company social info").font(.footnote).foregroundColor(.gray).padding(.leading,30)
                            .padding(.bottom, 20)
                        
                        
                        VStack(alignment:.center, spacing: 20){
                            
                            TextField("Instagram", text: $instagram)
                                .frame(height:52)
                                .background(Color.white).cornerRadius(10)
                                .multilineTextAlignment(TextAlignment.center).padding(.horizontal, 30)
                                .autocapitalization(.none)
                            
                            TextField("Twitter ", text: $twitter).frame(height:52)
                                .background(Color.white).cornerRadius(10)
                                .multilineTextAlignment(TextAlignment.center).padding(.horizontal, 30)
                                .autocapitalization(.none)
                            
                            TextField("Website ", text: $website).frame(height:52)
                                .background(Color.white).cornerRadius(10)
                                .multilineTextAlignment(TextAlignment.center).padding(.horizontal, 30)
                                .autocapitalization(.none)
                            
                            
                            Button {
                                showFourthCard = true
                            } label: {
                                
                                HStack {
                                    Text("Continue")
                                    Image(systemName: "arrow.right")
                                }
                            }
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                    }
                    
                }
                
            }
            
            if showFourthCard {
                
                ZStack(alignment: .top){
                    Color("backgroundColor2").edgesIgnoringSafeArea(.all)
                    
                    VStack(alignment: .leading){
                        
                        GeometryReader { geometry in
                            
                            Image("typing").resizable().aspectRatio( contentMode: .fit)
                                .frame(width: geometry.size.width, height: 150)
                        }.frame(height:150)
                        
                        
                        
                        Text("Let people know \nyour story. ").font(.largeTitle).bold()
                            .padding(.leading,30)
                            .padding(.bottom, 5)
                        
                        Text("Write something short & sweet about what you do").font(.footnote).foregroundColor(.gray).padding(.leading,30)
                            .padding(.bottom, 20)
                        
                        
                        VStack(alignment:.center, spacing: 20){
                            
                            
                            
                            TextEditor(text: $bio)
                                .frame(height:150)
                                .background(Color.white).cornerRadius(10)
                                .padding(.horizontal, 30)
                                .padding(.bottom, 15)
                            
                            
                            
                            Text("\(textCount - bio.count) characters left").font(.footnote)
                            
                            
                            
                            
                            GlowButtonView(label: "Finish"){
                                
                                var countHolder : Int
                                
                                countHolder = bio.count
                                
                                if countHolder > 120 {
                                    
                                    showAlert = true
                                    
                                } else{
                                    
                                    let userData = UserModel(name: name, email: email, phone: phone, company: company, position: position, twitter: twitter, instagram: instagram, website: website, bio: bio)
                                    
                                    currentModel = userData
                                    
                                    
                                    DatabaseManager.shared.saveUserProfile(model: userData) { success in
                                        
                                        if success {
                                            
                                        }
                                        else{
                                            
                                        }
                                        
                                    }
                                    
                                    showProfileView = true
                                    
                                }
                                
                                
                                
                            }.padding(.horizontal,100)
                                .alert(isPresented: $showAlert) {
                                    
                                    Alert(title: Text("Character Limit exceeded."), message: Text("Shorten your text. Remember, short & sweet!"), dismissButton: .default(Text("Got it.")))
                                }
                            
                        
                            
                        }
                        
                        
                        
                        
                        
                        
                    }
                    
                }
                
                
            }
            
        }

        
        
        
    }
    
    
    
    
}





struct OnboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardScreen(name: "", email: "", phone: "", company: "", position: "", twitter: "", instagram: "", website: "", bio: "")
            
        }
    }
}




