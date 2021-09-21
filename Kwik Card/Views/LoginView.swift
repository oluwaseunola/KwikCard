//
//  ContentView.swift
//  Kwik Card
//
//  Created by Seun Olalekan on 2021-09-14.
//

import SwiftUI
import CoreData
import FirebaseAuth
import Combine

struct LoginView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    
    @State private var newUser : Bool = false
    @State private var email : String = ""
    @State private var password : String = ""
    
    
    
    @State var name : String = ""
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
    @State var showOnboardView : Bool = false
    @State var rememberMe : Bool = false
    
    
    
    
    
    var body: some View {
        
        ZStack{
            
            Image("funBackground").resizable().aspectRatio( contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(){
                
                
                
                VStack(alignment:.leading){
                    
                    Image("logo").resizable().aspectRatio(contentMode: .fit).frame(height: 20)
                        .frame(maxWidth:350)
                        .padding(50)
                    
                    
                    Text(newUser ? "Sign Up" : "Sign in").font(.largeTitle).bold()
                        .padding(.top, 15).padding(.bottom, 10).autocapitalization(.none)
                    
                    HStack{
                        
                        Text(newUser ? "Already have an account?" : "Don't have an account?")
                        Button {
                            
                            withAnimation(.linear) {
                                newUser.toggle()
                                
                            }
                            
                            
                            
                        } label: {
                            Text(newUser ? "Sign In" : "Sign Up")
                        }
                        
                    }.padding(.bottom,20)
                    
                    
                    
                    
                    ZStack(alignment: .leading){
                        TextField("Email", text: $email).frame( height: 50)  .multilineTextAlignment(TextAlignment.center)
                            .background(Color.white).autocapitalization(.none)
                        
                            .cornerRadius(10)
                        IconView(imageName: "envelope")
                        
                    }.padding(.bottom)
                    
                    
                    
                    
                    
                    ZStack(alignment: .leading) {
                        SecureField("Password", text: $password).frame( height: 50)  .multilineTextAlignment(TextAlignment.center).background(Color.white)
                            .cornerRadius(10)
                            .autocapitalization(.none)
                        
                        IconView(imageName: "key")
                    }
                    
                    
                    GlowButtonView(label: newUser ? "Create Account" : "Sign In" ){
                        
                        
                        if newUser{
                            AuthManager.shared.createUser(email: email, password: password) { success in
                                
                                if success{
                                    UserDefaults.standard.set(email, forKey: "userEmail")
                                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                                    print("created success")
                                    
                                    DispatchQueue.main.async {
                                        
                                        withAnimation(.linear) {
                                            showOnboardView = true
                                            showFirstCard = true
                                        }
                                        
                                    }
                                    
                                }
                                else {
                                    
                                    //                                        show error alert
                                }
                                
                                
                            }
                            
                            
                            
                        }else{
                            
                            
                            
                            
                            AuthManager.shared.logIn(email: email, password: password) { success in
                                if success{
                                    UserDefaults.standard.set(email, forKey: "userEmail")
                                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                                    showProfileView = true
                                }else{
                                    //                                        show error
                                }
                            }
                            
                        }
                        
                        
                        
                    }.padding(.top)
                    
                    
                    Toggle(isOn: $rememberMe) {
                        Text("Remember me")
                    }.padding()
                    
                    
                }.padding(.horizontal)
                
                
            }.frame(width: 350, height: 600, alignment: .center)
                .background(Color.white.opacity(0.7))
                .cornerRadius(30)
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.white))
                .shadow(color: Color.white.opacity(0.7), radius: 30, x: 0, y: 20)
            
            
            
            
            
            
            
            if showOnboardView {
                
                ZStack {
                    
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
                                
                                
                            }.padding(.horizontal,50)
                            
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
                                    
                                    
                                    
                                    HStack(spacing: 10){
                                        
                                        Button {
                                            showSecondCard = false
                                            
                                            
                                        } label: {
                                            
                                            HStack {
                                                Image(systemName: "arrow.left")
                                                Text("Back")
                                            }
                                        }
                                        
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
                            
                        }.padding(.horizontal,50)
                        
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
                                    
                                    
                                    HStack(spacing: 10){
                                        
                                        Button {
                                            showThirdCard = false
                                            
                                            
                                        } label: {
                                            
                                            HStack {
                                                Image(systemName: "arrow.left")
                                                Text("Back")
                                            }
                                        }
                                        
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
                                
                                
                            }.padding(.horizontal,50)
                            
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
                                    
                                    
                                    Button {
                                        showFourthCard = false
                                        
                                        
                                    } label: {
                                        
                                        HStack {
                                            Image(systemName: "arrow.right")
                                            Text("Back")
                                        }
                                    }.padding()
                                    
                                    
                                    
                                }
                                
                                
                            }.padding(.horizontal,50)
                            
                        }
                        
                        
                    }
                    
                }
                
            }
            
        }.fullScreenCover(isPresented: $showProfileView) {
            showFirstCard = false
            showSecondCard = false
            showThirdCard = false
            showFourthCard = false
            showOnboardView = false
            
            if !rememberMe{
                email = ""
                password = ""
            }
            
        } content: {
            ProfileView()
        }
        
        
    }
    
    
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
