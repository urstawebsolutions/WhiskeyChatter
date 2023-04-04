//
//  ContentView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 3/29/23.
//

import SwiftUI
import FirebaseAuth


struct WCLoginView: View {
    @EnvironmentObject var model: DataModel
    @State var login = LoginMode.login
    @State var emailAddress = ""
    @State var username = ""
    @State var password = ""
    
    //Login Enum
    enum LoginMode{
        case login
        case createAccount
    }
    
    //Set button text based on login mode
    var buttonText: String {
        if login == LoginMode.login {
            return "Login"
        }
        else {
            return "Create Account"
        }
    }
   
    var body: some View {
        ZStack{
            //Image("bar-background").resizable().aspectRatio(contentMode: //.fill).edgesIgnoringSafeArea(.all)
            
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
                }
                
                Button{
                    if login == LoginMode.login{
                        
                    }
                    else{
                        
                    }
                }label:{
                    ZStack {
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(height:40)
                            .cornerRadius(10)
                        
                        Text(buttonText)
                            .foregroundColor(.white)
                    }
                    
                }
                Spacer()
            }
        }.padding(.horizontal, 40)
            .textFieldStyle(RoundedBorderTextFieldStyle())

    }
}


struct WCLoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        WCLoginView()
    }
}
