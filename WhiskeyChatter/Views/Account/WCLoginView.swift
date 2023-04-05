

//
//  ContentView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 3/29/23.
//

import SwiftUI
import FirebaseAuth
import Firebase


struct WCLoginView: View {
    @EnvironmentObject var model: DataModel
    @State var login = LoginMode.login
    @State var emailAddress = ""
    @State var username = ""
    @State var password = ""
    @State var errorMessage: String?
    
    
    //Login Enum
    enum LoginMode{
        case login
        case createAccount
    }
    
    //Set button text based on login mode
    var buttonText: String {
        if login == LoginMode.login {
            return "LOGIN"
        }
        else {
            return "CREATE ACCOUNT"
        }
    }
   
    var body: some View {
        ZStack{
            VStack(spacing: 10){
                Spacer()
                // Logo
                Image("whiskey-chatter-logo")
                
                Spacer()
                
                Picker(selection: $login, label: Text("Hey")) {
                    Text("Login")
                        .tag(LoginMode.login)
                    Text("Create Account")
                        .tag(LoginMode.createAccount)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Group{
                    TextField("Email", text: $emailAddress)
                        
                        
                    
                    if login == LoginMode.createAccount{
                        TextField("Username", text: $username)
                    }
                    
                    SecureField("Password", text: $password)
                }.textFieldStyle(.roundedBorder)
                
                Button{
                    if login == LoginMode.login {
                        
                        // Log the user in
                        Auth.auth().signIn(withEmail: emailAddress, password: password) { result, error in
                            
                            // Check for errors
                            guard error == nil else {
                                self.errorMessage = error!.localizedDescription
                                return
                            }
                            // Clear error message
                            self.errorMessage = nil
                            
                            // Fetch the user meta data
                            //self.model.getUserData()
                            
                            // Change the view to logged in view
                            self.model.checkLogin()
                        }
                    }
                    else {
                        // Create a new account
                        Auth.auth().createUser(withEmail: emailAddress, password: password) { result, error in
                            
                            // Check for errors
                            guard error == nil else {
                                self.errorMessage = error!.localizedDescription
                                return
                            }
                            // Clear error message
                            self.errorMessage = nil
                            
                            // Save the first name
                            let firebaseuser = Auth.auth().currentUser
                            let db = Firestore.firestore()
                            let ref = db.collection("users").document(firebaseuser!.uid)
                            
                            ref.setData(["username":username], merge: true)
                            
                            // Update the user meta data
                            //let user = UserService.shared.user
                            //user.username = username
                            
                            // Change the view to logged in view
                            self.model.checkLogin()
                        }
                    }
                }label:{
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(height:40)
                            .cornerRadius(10)
                        
                        Text(buttonText)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    
                }
                    .overlay(
                            RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.white, lineWidth: 2)
                    )
                Spacer()
            }
        }.padding(.horizontal, 40)
            .background(
                    Image("login-background")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                )

    }
}


struct WCLoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        WCLoginView()
    }
}
